//
//  Reducing.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 18.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

protocol Reducing {
    associatedtype State: Defaultable

    func mutate(state: inout State, applying action: Action)
}

extension Reducing {

    func callAsFunction(action: Action, state: State?) -> State {
        var state = state ?? .default
        mutate(state: &state, applying: action)
        return state
    }

}
