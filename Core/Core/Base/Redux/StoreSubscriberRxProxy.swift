//
//  StoreSubscriberRxProxy.swift
//  Core
//
//  Created by Yury Buslovsky on 29.09.2020.
//

import RxSwift
import ReSwift

public final class StoreSubscriberRxProxy<StateType>: StoreSubscriber {

    private let observer: AnyObserver<StateType>

    public init(observer: AnyObserver<StateType>) {
        self.observer = observer
    }

    public func newState(state: StateType) {
        observer.onNext(state)
    }

}
