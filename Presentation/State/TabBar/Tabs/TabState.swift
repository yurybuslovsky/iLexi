//
//  TabState.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

enum TabState: Equatable {
    case entryList(EntryListState)
}

// MARK: - Default

extension TabState {
    static var `default`: TabState { .entryList(.default) }
}
