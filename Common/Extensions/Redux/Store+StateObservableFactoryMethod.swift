//
//  Store+StateObservableFactoryMethod.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import RxSwift
import ReSwift

extension Store where State: Equatable {

    func makeObservable() -> Observable<State> {
        .create { [weak self] (observer: AnyObserver<State>) -> Disposable in
            guard let self = self else { return Disposables.create() }

            let proxy = StoreSubscriberRxProxy(observer: observer)
            self.subscribe(proxy)

            return Disposables.create { [weak self] in
                self?.unsubscribe(proxy)
            }
        }
    }

    func makeScopedObservable<SelectedState: Equatable>(
        transform: @escaping FactoryBlock<
            Subscription<State>,
            Subscription<ScopedState<SelectedState>>
        >
    ) -> Observable<SelectedState> {
        .create { [weak self] (observer: AnyObserver<SelectedState>) -> Disposable in
            guard let self = self else { return Disposables.create() }

            let proxy = ScopedStoreSubscriberRxProxy(observer: observer)
            self.subscribe(proxy, transform: transform)

            return Disposables.create { [weak self] in
                self?.unsubscribe(proxy)
            }
        }
    }

}
