//
//  EntryListReducer.swift
//  Reducers_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import Reducers
import State_iOS
import ReSwift

public extension iOSApp.TabBar.EntryList {

    struct Reducer: Reducing {

        public func mutate(state: inout State, applying action: Action) {
            state.topControllerStateStack = state.topControllerStateStack
                .map { (topControllerState: TopControllerState) -> TopControllerState in
                    var newTopControllerState = topControllerState

                    switch newTopControllerState {
                    case let .root(rootState):
                        newTopControllerState = .root(Root.Reducer()(action: action, state: rootState))
                    }

                    return newTopControllerState
                }
        }

    }

}
