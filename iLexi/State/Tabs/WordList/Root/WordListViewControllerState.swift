//
//  WordListViewControllerState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct WordListViewControllerState: Equatable {
    var authState: AuthState
    var wordGraphState: WordGraphState
}

// MARK: - Default

extension WordListViewControllerState {
    static var `default`: WordListViewControllerState { .init(authState: .default, wordGraphState: .default) }
}
