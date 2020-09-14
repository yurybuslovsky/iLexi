//
//  WordListState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct WordListState: Equatable {
    var ncStateStack: [WordListNavigationControllerState]
    var authState: AuthState
    var wordGraphState: WordGraphState
}

// MARK: - Default

extension WordListState {
    static var `default`: WordListState { .init(
        ncStateStack: [.default],
        authState: .default,
        wordGraphState: .default
    )}
}
