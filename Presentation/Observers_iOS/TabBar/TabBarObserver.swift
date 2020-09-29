//
//  TabBarObserver.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import RxSwift

// MARK: - Event Responder Protocol

protocol TabBarEventResponder: class {
    func respondToEntryInfoPresentation()
}

// MARK: - Auxiliary

private typealias TabBar = iOSApp.TabBar
private typealias Observer = TabBar.Observer

extension TabBar {
    typealias EventResponder = TabBarEventResponder
}

// MARK: - Declaration

extension TabBar {

    final class Observer<ER: EventResponder>: BaseObserver<ER> {

        private let appState: Observable<iOSApp.State>

        init(appState: Observable<iOSApp.State>) {
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

    func startObserving() {
        guard canStartObserving else { return }
        subscribeToTopControllerState()
    }

}
