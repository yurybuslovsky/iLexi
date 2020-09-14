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
        var ncStateStack = state.ncStateStack

        ncStateStack = ncStateStack
            .map { (wordListNCState: WordListNavigationControllerState) -> WordListNavigationControllerState in
                WordListNavigationControllerReducer()(action: action, state: wordListNCState)
            }

        state.authState = AuthReducer()(action: action, state: state.authState)
        state.wordGraphState = WordGraphReducer()(action: action, state: state.wordGraphState)

        switch action {
        case let action as WordListViewControllerActions.Navigation:
            apply(action: action, to: &ncStateStack, given: state)

        case is WordListNavigationControllerActions.HandleTopVCPop:
            ncStateStack.removeLast()

        default:
            break
        }

        state.ncStateStack = ncStateStack
        return state
    }

}

// MARK: - Private API

extension WordListReducer {

    private func apply(
        action: WordListViewControllerActions.Navigation,
        to stateStack: inout [WordListNavigationControllerState],
        given state: WordListState
    ) {
        switch action {
        case .goToFavorites:
            stateStack.append(.favorites(FavoritesViewControllerState(
                authState: state.authState,
                wordGraphState: state.wordGraphState
            )))

        default:
            break
        }
    }

}
