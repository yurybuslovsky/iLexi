//
//  TabState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

enum TabState: Equatable {
    case wordList(WordListState)
    case userProfile(UserProfileState)
}

// MARK: - Default

extension TabState {
    static var `default`: TabState { .wordList(.default) }
}
