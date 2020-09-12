//
//  WordListState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct WordListState: Equatable {
    let stateStack: [WordListNavigationControllerState]

    init(stateStack: [WordListNavigationControllerState] = [.default]) {
        self.stateStack = stateStack
    }
}

// MARK: - Default

extension WordListState {
    static var `default`: WordListState { .init() }
}
