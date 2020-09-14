//
//  WordViewControllerState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct WordViewControllerState: Equatable {
    var wordOperationState: WordOperationState
    var wordGraphState: WordGraphState
}

// MARK: - Default

extension WordViewControllerState {
    static var `default`: WordViewControllerState { .init(wordOperationState: .default, wordGraphState: .default) }
}
