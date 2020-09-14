//
//  TabBarState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct TabBarState: Equatable {
    var wordListTabState: TabState
    var userProfileTabState: TabState
    var selectedTabState: TabState
}

// MARK: - Default

extension TabBarState {
    static var `default`: TabBarState { .init(
        wordListTabState: .default,
        userProfileTabState: .default,
        selectedTabState: .default
    )}
}
