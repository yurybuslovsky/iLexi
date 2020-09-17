//
//  TopVeController.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

enum TopViewControllerState: Equatable {
    case tabBar(TabBarState)
    case entryInfo(EntryInfoNavigationControllerState)
}

// MARK: - Default

extension TopViewControllerState {
    static var `default`: TopViewControllerState { .tabBar(.default) }
}
