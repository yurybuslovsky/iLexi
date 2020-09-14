//
//  WordGraphReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

struct WordGraphReducer {

    func callAsFunction(action: Action, state: WordGraphState?) -> WordGraphState {
        var state = state ?? .default

        switch action {
        case let action as WordListViewControllerActions.AsyncHandler:
            apply(action: action, to: &state)

        default:
            break
        }

        return state
    }

}

extension WordGraphReducer {

    private func apply(
        action: WordListViewControllerActions.AsyncHandler,
        to state: inout WordGraphState
    ) {
        switch action {
        case let .handleSuccess(newWordList):
            state.words = newWordList
        default:
            break
        }
    }

}
