//
//  FavoritesViewControllerActions.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

enum FavoritesViewControllerActions {

    // MARK: • Navigation

    enum Navigation: Action {
        case goToEditWord(wordIndex: Int)
    }

    // MARK: • Sync business logic

    enum Search: Action {
        case start
        case search(text: String)
        case cancel
    }

    // MARK: • Async business logic

    struct RemoveFromFavorites: Action {
        let wordIndex: Int
    }

    // MARK: • Async handlers

    enum AsyncHandler: Action {
        case handleError(Error)
        case handleSuccess(newWordList: Graph<EntryFormatted>)
    }

}
