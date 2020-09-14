//
//  TopViewControllerState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

enum TopViewControllerState: Equatable {
    case tabBar(TabBarState)
    case word(WordViewControllerState)
}

// MARK: - Default

extension TopViewControllerState {
    static var `default`: TopViewControllerState { .tabBar(.default) }
}
