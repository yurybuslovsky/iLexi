//
//  InterruptibleObserver.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 20.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

class InterruptibleObserver<EventResponder: AnyObject>: SubscriptionContainer, ObservingStopping {

    final weak var eventResponder: EventResponder? {
        willSet {
            if newValue == nil {
                stopObserving()
            }
        }
    }

}

// MARK: - Public API

extension InterruptibleObserver {

    final var isObserving: Bool {
        !subscriptions.isEmpty
    }

    final var canStartObserving: Bool {
        eventResponder != nil && !isObserving
    }

}
