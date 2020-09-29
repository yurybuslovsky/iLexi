//
//  EntryInfoControllerObserver.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 20.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import RxSwift

// MARK: - Event Responder Protocol

protocol EntryInfoControllerEventResponder: ErrorResponder {
    func respondToSuccessfulEntryAddition()
}

// MARK: - Auxiliary

private typealias EntryInfo = iOSApp.EntryInfo
private typealias Observer = EntryInfo.Observer

extension EntryInfo {
    typealias EventResponder = EntryInfoControllerEventResponder & Keyboard.EventResponder
}

// MARK: - Declaration

extension EntryInfo {

    final class Observer<ER: EventResponder>: BaseObserver<ER> {

        private let entryInfoState: Observable<State>

        init(entryInfoState: Observable<State>) {
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
                onNext: { [weak self] (result: VoidResult<Entry.Error>) in
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

    func startObserving() {
        guard canStartObserving else { return }
        subscribeToErrorState()
    }

}
