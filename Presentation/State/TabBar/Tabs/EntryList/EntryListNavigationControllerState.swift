//
//  EntryListNavigationControllerState.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

enum EntryListNavigationControllerState: Equatable {
    case root(EntryListViewControllerState)
}

// MARK: - Default

extension EntryListNavigationControllerState {
    static var `default`: EntryListNavigationControllerState { .root(.default) }
}
