//
//  WordListReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct WordListReducer {

    func callAsFunction(action: Action, state: WordListState?) -> WordListState {
        var state = state ?? .default

        var stateStack = state.stateStack

        switch action {
        case is WordListViewControllerActions.GoToFavorites:
            stateStack.append(.favorites(.default))

        case is WordListNavigationControllerActions.HandleTopVCPop:
            stateStack.removeLast()

        default:
            break
        }

        stateStack = stateStack
            .map { (wordListNCState: WordListNavigationControllerState) -> WordListNavigationControllerState in
                WordListNavigationControllerReducer()(action: action, state: wordListNCState)
            }

        state = WordListState(stateStack: stateStack)
        return state
    }

}
