//
//  StoreSubscriberRxProxy.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import RxSwift
import ReSwift

final class StoreSubscriberRxProxy<StateType>: StoreSubscriber {

    private let observer: AnyObserver<StateType>

    init(observer: AnyObserver<StateType>) {
        self.observer = observer
    }

    func newState(state: StateType) {
        observer.onNext(state)
    }

}
