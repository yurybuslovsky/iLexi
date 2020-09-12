//
//  AppState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

struct AppState: StateType, Equatable {
    let stateStack: [TopViewControllerState]

    init(stateStack: [TopViewControllerState] = [.default]) {
        self.stateStack = stateStack
    }
}

// MARK: - Default

extension AppState {
    static var `default`: AppState { .init() }
}
