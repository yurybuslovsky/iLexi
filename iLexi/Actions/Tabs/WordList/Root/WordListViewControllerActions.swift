//
//  WordListViewControllerActions.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

enum WordListViewControllerActions {

    // MARK: • Navigation

    enum Navigation: Action {
        case goToNewWord
        case goToEditWord(wordIndex: Int)
        case goToFavorites
    }

    // MARK: • Sync business logic

    struct Search: Action {
        let text: String
    }

    // MARK: • Async business logic

    struct FetchWords: Action {}

    struct Mutation: Action {
        let wordIndex: Int
        let mutationType: MutationType

        enum MutationType {
            case delete
            case addToFavorites
            case removeFromFavorites
        }
    }

    // MARK: • Async handlers

    enum AsyncHandler: Action {
        case handleError(Error)
        case handleSuccess(newWordList: Graph<EntryFormatted>)
    }

}
