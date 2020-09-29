//
//  ScopedState.swift
//  Core
//
//  Created by Yury Buslovsky on 29.09.2020.
//

public enum ScopedState<StateType: Equatable>: Equatable {
    case outOfScope
    case inScope(StateType)
}
