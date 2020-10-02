//
//  SubscriptionContainer.swift
//  Observers
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import RxSwift

// MARK: - Declaration

open class SubscriptionContainer {

    public final let disposeBag: DisposeBag = .init()
    private(set) var subscriptions: [Disposable] = []

}

// MARK: - Public API

public extension SubscriptionContainer {

    final func add(subscription: Disposable) {
        subscriptions.append(subscription)
    }

    final func dispose() {
        for subscription in subscriptions {
            subscription.dispose()
        }

        subscriptions.removeAll()
    }

}
