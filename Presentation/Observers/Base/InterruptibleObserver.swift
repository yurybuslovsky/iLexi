//
//  InterruptibleObserver.swift
//  Observers
//
//  Created by Yury Buslovsky on 02.10.2020.
//

// MARK: - Declaration

open class InterruptibleObserver<EventResponder: AnyObject>: SubscriptionContainer, ObservingStopping {

    public final weak var eventResponder: EventResponder? {
        willSet {
            if newValue == nil {
                stopObserving()
            }
        }
    }

    public override init() {}

}

// MARK: - Public API

extension InterruptibleObserver {

    public final var canStartObserving: Bool {
        eventResponder != nil && subscriptions.isEmpty
    }

}
