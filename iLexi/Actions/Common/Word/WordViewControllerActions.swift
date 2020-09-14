//
//  WordViewControllerActions.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

enum WordViewControllerActions {

    // MARK: • Navigation

    enum Navigation: Action {
        case close
        case showSynonym(synonymIndex: Int)
    }

    // MARK: • Sync business logic

    enum AddDefinition: Action {
        case start
        case cancel
        case confirm(definition: String)
    }

    enum AddTranslation: Action {
        case start
        case cancel
        case confirm(translation: String)
    }

    enum AddSynonym: Action {
        case start
        case search(text: String)
        case cancel
        case confirm(synonymIndex: Int)
    }

    struct Deletion: Action {
        let subjectIndex: Int

        enum DeletionSubject {
            case definition
            case translation
            case synonym
        }
    }

    // MARK: • Async business logic

    enum Favorites: Action {
        case addTo
        case removeFrom
    }

    struct Save: Action {}

    // MARK: • Async handlers

    enum AsyncHandler: Action {
        case handleError(Error)
        case handleSuccess(newWordList: Graph<EntryFormatted>)
    }

}
