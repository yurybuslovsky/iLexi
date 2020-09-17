//
//  EntryListState.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct EntryListState: Equatable {
    var ncStateStack: [EntryListNavigationControllerState]
}

// MARK: - Default

extension EntryListState {
    static var `default`: EntryListState { .init(ncStateStack: [.default]) }
}
