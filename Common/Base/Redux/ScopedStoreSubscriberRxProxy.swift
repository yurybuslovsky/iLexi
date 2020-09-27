//
//  ScopedStoreSubscriberRxProxy.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import RxSwift
import ReSwift

final class ScopedStoreSubscriberRxProxy<StateType: Equatable>: StoreSubscriber {

    private let observer: AnyObserver<StateType>

    init(observer: AnyObserver<StateType>) {
        self.observer = observer
    }

    func newState(state: ScopedState<StateType>) {
        switch state {
        case let .inScope(state):
            observer.onNext(state)
        case .outOfScope:
            observer.onCompleted()
        }
    }

}
