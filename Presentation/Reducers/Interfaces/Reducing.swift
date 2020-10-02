//
//  Reducing.swift
//  Reducers
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import ReSwift
import State

public protocol Reducing {
    associatedtype State: Defaultable

    func mutate(state: inout State, applying action: Action)
}

public extension Reducing {

    func callAsFunction(action: Action, state: State?) -> State {
        var state = state ?? .default
        mutate(state: &state, applying: action)
        return state
    }

}
