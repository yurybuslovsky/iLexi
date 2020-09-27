//
//  ObservingStopping.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 19.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

protocol ObservingStopping {}

extension ObservingStopping where Self: SubscriptionContainer {

    func stopObserving() {
        dispose()
    }

}
