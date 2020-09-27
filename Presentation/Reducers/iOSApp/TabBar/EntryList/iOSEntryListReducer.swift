//
//  iOSEntryListReducer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 18.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

extension iOSApp.TabBar.EntryList {

    struct Reducer: Reducing {

        func mutate(state: inout State, applying action: Action) {
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
