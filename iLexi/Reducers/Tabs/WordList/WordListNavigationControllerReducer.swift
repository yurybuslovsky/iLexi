//
//  WordListNavigationControllerReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct WordListNavigationControllerReducer {

    func callAsFunction(
        action: Action,
        state: WordListNavigationControllerState?
    ) -> WordListNavigationControllerState {
        var state = state ?? .default

        switch state {
        case let .root(wordListViewControllerState):
            state = .root(WordListViewControllerReducer()(action: action, state: wordListViewControllerState))
        case let .favorites(favoritesViewControllerState):
            state = .favorites(FavoritesViewControllerReducer()(action: action, state: favoritesViewControllerState))
        }

        return state
    }

}
