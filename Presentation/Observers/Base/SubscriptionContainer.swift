//
//  SubscriptionContainer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 19.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import RxSwift

// MARK: - Declaration

class SubscriptionContainer {

    final let disposeBag: DisposeBag = .init()
    private(set) var subscriptions: [Disposable] = []

}

// MARK: - Public API

extension SubscriptionContainer {

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
