//
//  TabBarState.swift
//  State_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import State

// MARK: - Namespace

private typealias TabBar = iOSApp.TabBar

// MARK: - Auxiliary

public extension TabBar {

    enum TabState: Equatable, Defaultable {
        public static var `default`: Self { .entryList(.default) }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            true
        }

        case entryList(EntryList.State)
    }

}

// MARK: - Declaration

public extension TabBar {

    struct State: Equatable, Defaultable {
        public static var `default`: Self { .init(
            entryListState: .entryList(.default),
            selectedTabState: .default
        )}

        public var entryListState: TabState
        public var selectedTabState: TabState
    }

}

// MARK: - Scoping

public extension TabBar {

    static func makeTabBarScopedState(from state: iOSApp.State) -> ScopedState<State> {
        switch state.topControllerStateStack.last {
        case let .some(.tabBar(tabBarState)):
            return .inScope(tabBarState)
        default:
            return .outOfScope
        }
    }

}
