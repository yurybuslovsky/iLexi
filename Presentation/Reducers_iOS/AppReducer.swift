//
//  AppReducer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 18.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

extension iOSApp {

    struct Reducer: Reducing {

        func mutate(state: inout State, applying action: Action) {
            var topControllerStateStack = state.topControllerStateStack

            switch action {
            case is GoToEntryInfo:
                topControllerStateStack.append(.entryInfo(.default))

            case is DismissEntryInfo:
                topControllerStateStack.removeLast()

            default:
                break
            }

            state.topControllerStateStack = topControllerStateStack
                .map { (topControllerState: TopControllerState) -> TopControllerState in
                    var newTopControllerState = topControllerState

                    switch newTopControllerState {
                    case let .tabBar(tabBarState):
                        newTopControllerState = .tabBar(TabBar.Reducer()(action: action, state: tabBarState))
                    case let .entryInfo(entryInfoState):
                        newTopControllerState = .entryInfo(EntryInfo.Reducer()(action: action, state: entryInfoState))
                    }

                    return newTopControllerState
                }
        }

    }

}
