//
//  ObservingStopping.swift
//  Observers
//
//  Created by Yury Buslovsky on 30.09.2020.
//

public protocol ObservingStopping {}

public extension ObservingStopping where Self: SubscriptionContainer {

    func stopObserving() {
        dispose()
    }

}
