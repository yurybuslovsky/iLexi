//
//  TabBarState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct TabBarState: Equatable {
    let wordListState: WordListState
    let userProfileState: UserProfileState

    init(
        wordListState: WordListState = .default,
        userProfileState: UserProfileState = .default
    ) {
        self.wordListState = wordListState
        self.userProfileState = userProfileState
    }
}

// MARK: - Default

extension TabBarState {
    static var `default`: TabBarState { .init() }
}
