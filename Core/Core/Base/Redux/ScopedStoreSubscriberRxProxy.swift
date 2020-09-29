//
//  ScopedStoreSubscriberRxProxy.swift
//  Core
//
//  Created by Yury Buslovsky on 29.09.2020.
//

import RxSwift
import ReSwift

public final class ScopedStoreSubscriberRxProxy<StateType: Equatable>: StoreSubscriber {

    private let observer: AnyObserver<StateType>

    public init(observer: AnyObserver<StateType>) {
        self.observer = observer
    }

    public func newState(state: ScopedState<StateType>) {
        switch state {
        case let .inScope(state):
            observer.onNext(state)
        case .outOfScope:
            observer.onCompleted()
        }
    }

}
