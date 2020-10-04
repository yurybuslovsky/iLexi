//
//  EntriesObserver.swift
//  Observers
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import State_iOS
import Entities
import RxSwift

// MARK: - Event Responder Protocol

public protocol EntriesEventResponder: class {
    func respondTo(newEntries: [Entry])
}

// MARK: - Declaration

public final class EntriesObserver<ER: EntriesEventResponder>: BaseObserver<ER> {

    private let appState: Observable<iOSApp.State>

    public init(appState: Observable<iOSApp.State>) {
        self.appState = appState
    }

}

// MARK: - Private API

extension EntriesObserver {

    private func subscribeToEntriesState() {
        let entriesStateSubscription = appState
            .map { $0.entries.toArray() }
            .distinctUntilChanged()
            .subscribe(
                onNext: { [weak self] (entries: [Entry]) in
                    self?.eventResponder?.respondTo(newEntries: entries)
                }
            )

        entriesStateSubscription.disposed(by: disposeBag)
        add(subscription: entriesStateSubscription)
    }

}

// MARK: - Observing

extension EntriesObserver {

    public func startObserving() {
        guard canStartObserving else { return }
        subscribeToEntriesState()
    }

}
