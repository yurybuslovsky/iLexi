//
//  AppReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

struct AppReducer {

    func callAsFunction(action: Action, state: AppState?) -> AppState {
        var state = state ?? .default
        var topVCStateStack = state.topVCStateStack

        topVCStateStack = topVCStateStack
            .map { (topVCState: TopViewControllerState) -> TopViewControllerState in
                TopViewControllerReducer()(action: action, state: topVCState)
            }

        state.wordGraphState = WordGraphReducer()(action: action, state: state.wordGraphState)

        switch action {
        case let action as WordListViewControllerActions.Navigation:
            apply(action: action, to: &topVCStateStack, given: state)

        case let action as WordViewControllerActions.Navigation:
            apply(action: action, to: &topVCStateStack)

        default:
            break
        }

        state.topVCStateStack = topVCStateStack
        return state
    }

}

// MARK: - Private API

extension AppReducer {

    private func apply(
        action: WordListViewControllerActions.Navigation,
        to stateStack: inout [TopViewControllerState],
        given state: AppState
    ) {
        let wordGraphState = state.wordGraphState

        switch action {
        case .goToNewWord:
            stateStack.append(.word(WordViewControllerState(
                wordOperationState: .new,
                wordGraphState: wordGraphState
            )))

        case let .goToEditWord(wordIndex):
            stateStack.append(.word(WordViewControllerState(
                wordOperationState: .edit(word: wordGraphState.words[wordIndex]),
                wordGraphState: wordGraphState
            )))

        default:
            break
        }
    }

    private func apply(
        action: WordViewControllerActions.Navigation,
        to stateStack: inout [TopViewControllerState]
    ) {
        if case .close = action {
            stateStack.removeLast()
        }
    }

}
