//
//  AppReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct AppReducer {

    func callAsFunction(action: Action, state: AppState?) -> AppState {
        var state = state ?? .default

        var stateStack = state.stateStack

        switch action {
        case is WordListViewControllerActions.GoToNewWord:
            stateStack.append(.newWord(.default))

        case is NewWordViewControllerActions.Cancel:
            fallthrough

        case is NewWordViewControllerActions.SaveNewWord:
            stateStack.removeLast()

        default:
            break
        }

        stateStack = stateStack
            .map { (topVCState: TopViewControllerState) -> TopViewControllerState in
                TopViewControllerReducer()(action: action, state: topVCState)
            }

        state = AppState(stateStack: stateStack)
        return state
    }

}
