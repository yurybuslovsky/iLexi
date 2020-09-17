//
//  TabBarState.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct TabBarState: Equatable {
    var entryListTabState: TabState
    var selectedTabState: TabState
}

// MARK: - Default

extension TabBarState {
    static var `default`: TabBarState { .init(
        entryListTabState: .default,
        selectedTabState: .default
    )}
}
