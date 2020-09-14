//
//  TabBarReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct TabBarReducer {

    func callAsFunction(action: Action, state: TabBarState?) -> TabBarState {
        var state = state ?? .default

        switch action {
        case let action as TabBarActions.ChangeTab:
            switch action.newTab {
            case .wordList:
                state.selectedTabState = state.wordListTabState
            case .userProfile:
                state.selectedTabState = state.userProfileTabState
            }

        default:
            break
        }

        state.wordListTabState = TabReducer()(action: action, state: state.wordListTabState)
        state.userProfileTabState = TabReducer()(action: action, state: state.userProfileTabState)

        return state
    }

}
