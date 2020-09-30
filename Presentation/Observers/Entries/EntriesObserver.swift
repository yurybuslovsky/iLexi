//
//  EntriesObserver.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 20.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import RxSwift

// MARK: - Event Responder Protocol

protocol EntriesEventResponder: class {
    func respondTo(newEntries: [Entry])
}

// MARK: - Declaration

final class EntriesObserver<ER: EntriesEventResponder>: BaseObserver<ER> {

    private let appState: Observable<iOSApp.State>

    init(appState: Observable<iOSApp.State>) {
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

    func startObserving() {
        guard canStartObserving else { return }
        subscribeToEntriesState()
    }

}
