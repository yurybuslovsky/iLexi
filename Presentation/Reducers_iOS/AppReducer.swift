//
//  AppReducer.swift
//  Reducers_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import Actions
import Reducers
import State_iOS
import ReSwift

// MARK: - Namespace

private extension iOSApp {
    typealias GoToEntryInfo = Actions.EntryList.GoToEntryInfo
    typealias DismissEntryInfo = Actions.EntryInfo.Dismiss
}

// MARK: - Declaration

public extension iOSApp {

    struct Reducer: Reducing {

        public init() {}

        public func mutate(state: inout State, applying action: Action) {
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
