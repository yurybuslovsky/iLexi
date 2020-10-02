//
//  EntryListState.swift
//  State_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import State

// MARK: - Auxiliary

public extension iOSApp.TabBar.EntryList {

    enum TopControllerState: Equatable, Defaultable {
        public static var `default`: Self { .root(.default) }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            true
        }

        case root(Root.State)
    }

}

// MARK: - Declaration

public extension iOSApp.TabBar.EntryList {

    struct State: Equatable, Defaultable {
        public static var `default`: Self { .init(topControllerStateStack: [.default]) }

        public var topControllerStateStack: [TopControllerState]
    }

}
