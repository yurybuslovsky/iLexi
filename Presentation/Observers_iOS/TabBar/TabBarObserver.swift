//
//  TabBarObserver.swift
//  Observers_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import Observers
import RxSwift

// MARK: - Event Responder Protocol

public protocol TabBarEventResponder: class {
    func respondToEntryInfoPresentation()
}

// MARK: - Auxiliary

private typealias TabBar = iOSApp.TabBar
private typealias Observer = TabBar.Observer

public extension TabBar {
    typealias EventResponder = TabBarEventResponder
}

// MARK: - Declaration

public extension TabBar {

    final class Observer<ER: EventResponder>: BaseObserver<ER> {

        private let appState: Observable<iOSApp.State>

        public init(appState: Observable<iOSApp.State>) {
            self.appState = appState
        }

    }

}

// MARK: - Private API

extension Observer {

    private func subscribeToTopControllerState() {
        let topControllerStateSubscription = appState
            .compactMap(\.topControllerStateStack.last)
            .distinctUntilChanged()
            .subscribe(
                onNext: { [weak self] (topControllerState: iOSApp.TopControllerState) in
                    switch topControllerState {
                    case .entryInfo:
                        self?.eventResponder?.respondToEntryInfoPresentation()
                    default:
                        break
                    }
                }
            )

        topControllerStateSubscription.disposed(by: disposeBag)
        add(subscription: topControllerStateSubscription)
    }

}

// MARK: - Observing

extension Observer {

    public func startObserving() {
        guard canStartObserving else { return }
        subscribeToTopControllerState()
    }

}
