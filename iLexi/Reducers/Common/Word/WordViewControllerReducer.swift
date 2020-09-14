//
//  WordViewControllerReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

struct WordViewControllerReducer {

    func callAsFunction(action: Action, state: WordViewControllerState?) -> WordViewControllerState {
        var state = state ?? .default

        state.wordGraphState = WordGraphReducer()(action: action, state: state.wordGraphState)

        switch action {
        case let action as WordListViewControllerActions.Navigation:
            apply(action: action, to: &state)

        default:
            break
        }

        return state
    }

}

// MARK: - Private API

extension WordViewControllerReducer {

    private func apply(
        action: WordListViewControllerActions.Navigation,
        to state: inout WordViewControllerState
    ) {
        switch action {
        case .goToNewWord:
            state.wordOperationState = .new

        case let .goToEditWord(wordIndex):
            state.wordOperationState = .edit(word: state.wordGraphState.words[wordIndex])

        default:
            break
        }
    }

}
