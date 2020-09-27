//
//  iOSTabBarState.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

private typealias TabBar = iOSApp.TabBar

// MARK: - Auxiliary

extension TabBar {

    enum TabState: Equatable, Defaultable {
        static var `default`: Self { .entryList(.default) }

        static func == (lhs: Self, rhs: Self) -> Bool {
            true
        }

        case entryList(EntryList.State)
    }

}

// MARK: - Declaration

extension TabBar {

    struct State: Equatable, Defaultable {
        static var `default`: Self { .init(
            entryListState: .entryList(.default),
            selectedTabState: .default
        )}

        var entryListState: TabState
        var selectedTabState: TabState
    }

}

// MARK: - Scoping

extension TabBar {

    static func makeTabBarScopedState(from state: iOSApp.State) -> ScopedState<State> {
        switch state.topControllerStateStack.last {
        case let .some(.tabBar(tabBarState)):
            return .inScope(tabBarState)
        default:
            return .outOfScope
        }
    }

}
