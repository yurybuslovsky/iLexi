//
//  FavoritesViewControllerState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct FavoritesViewControllerState: Equatable {

    var authState: AuthState
    private var _wordGraphState: WordGraphState = .default

    var wordGraphState: WordGraphState {
        get {
            _wordGraphState
        }

        set {
            filterFavorites(from: newValue.words)
        }
    }

    init(
        authState: AuthState,
        wordGraphState: WordGraphState
    ) {
        self.authState = authState
        self.wordGraphState = wordGraphState
    }

}

// MARK: - Default

extension FavoritesViewControllerState {
    static var `default`: FavoritesViewControllerState { .init(authState: .default, wordGraphState: .default) }
}

// MARK: - Private API

extension FavoritesViewControllerState {

    private mutating func filterFavorites(from words: Graph<EntryFormatted>) {
        _wordGraphState = WordGraphState(words: words.filter { (word: EntryFormatted) -> Bool in word.isFavorite })
    }

}
