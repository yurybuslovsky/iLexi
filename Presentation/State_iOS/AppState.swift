//
//  AppState.swift
//  State_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import State
import Entities
import ReSwift

// MARK: - Auxiliary

public extension iOSApp {

    enum TopControllerState: Equatable, Defaultable {
        public static var `default`: Self { .tabBar(.default) }

        public static func == (lhs: Self, rhs: Self) -> Bool {
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

public extension iOSApp {

    struct State: StateType, Equatable, Defaultable {
        public static var `default`: Self { .init(topControllerStateStack: [.default], entries: []) }

        public var topControllerStateStack: [TopControllerState]
        public var entries: Graph<Entry>
    }

}
