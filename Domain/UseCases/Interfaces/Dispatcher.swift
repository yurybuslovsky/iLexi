//
//  ActionDispatcher.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

protocol Dispatcher {
    func dispatch(_ action: Action)
}

extension Dispatcher {

    func callAsFunction(_ action: Action) {
        dispatch(action)
    }

}

extension Store: Dispatcher {}
