//
//  EntryInfoControllerObserver.swift
//  Observers_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import Actions
import Observers
import Entities
import RxSwift

// MARK: - Event Responder Protocol

public protocol EntryInfoControllerEventResponder: ErrorResponder {
    func respondToSuccessfulEntryAddition()
}

// MARK: - Auxiliary

private typealias EntryInfo = iOSApp.EntryInfo
private typealias Observer = EntryInfo.Observer

public extension EntryInfo {
    typealias EventResponder = EntryInfoControllerEventResponder & Keyboard.EventResponder
}

// MARK: - Declaration

public extension EntryInfo {

    final class Observer<ER: EventResponder>: BaseObserver<ER> {

        private let entryInfoState: Observable<State>

        public init(entryInfoState: Observable<State>) {
            self.entryInfoState = entryInfoState
        }

    }

}

// MARK: - Private API

extension Observer {

    private func subscribeToErrorState() {
        let errorStateSubscription = entryInfoState
            .map(\.entryAdditionResult)
            .subscribe(
                onNext: { [weak self] (result: Entities.VoidResult<Actions.EntryInfo.Error>) in
                    switch result {
                    case .success:
                        self?.eventResponder?.respondToSuccessfulEntryAddition()
                    case let .error(error):
                        self?.eventResponder?.respondTo(error: error)
                    case .unknown:
                        break
                    }
                }
            )

        errorStateSubscription.disposed(by: disposeBag)
        add(subscription: errorStateSubscription)
    }

}

// MARK: - Observing

extension Observer {

    public func startObserving() {
        guard canStartObserving else { return }
        subscribeToErrorState()
    }

}
