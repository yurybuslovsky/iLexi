//
//  iOSAppState.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Auxiliary

extension iOSApp {

    enum TopControllerState: Equatable, Defaultable {
        static var `default`: Self { .tabBar(.default) }

        static func == (lhs: Self, rhs: Self) -> Bool {
            switch (lhs, rhs) {
            case (.tabBar, tabBar):
                return true
            case (.entryInfo, entryInfo):
                return true
            default:
                return false
            }
        }

        case tabBar(TabBar.State)
        case entryInfo(EntryInfo.State)
    }

}

// MARK: - Declaration

extension iOSApp {

    struct State: StateType, Equatable, Defaultable {
        static var `default`: Self { .init(topControllerStateStack: [.default], entries: []) }

        var topControllerStateStack: [TopControllerState]
        var entries: Entries
    }

}
