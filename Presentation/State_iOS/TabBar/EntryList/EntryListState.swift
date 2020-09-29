//
//  iOSEntryListState.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Auxiliary

extension iOSApp.TabBar.EntryList {

    enum TopControllerState: Equatable, Defaultable {
        static var `default`: Self { .root(.default) }

        static func == (lhs: Self, rhs: Self) -> Bool {
            true
        }

        case root(Root.State)
    }

}

// MARK: - Declaration

extension iOSApp.TabBar.EntryList {

    struct State: Equatable, Defaultable {
        static var `default`: Self { .init(topControllerStateStack: [.default]) }

        var topControllerStateStack: [TopControllerState]
    }

}
