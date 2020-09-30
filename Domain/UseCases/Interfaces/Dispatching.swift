//
//  Dispatching.swift
//  UseCases
//
//  Created by Yury Buslovsky on 29.09.2020.
//

import ReSwift

public protocol Dispatching {
    func dispatch(_ action: Action)
}

public extension Dispatching {

    func callAsFunction(_ action: Action) {
        dispatch(action)
    }

}

extension Store: Dispatching {}
