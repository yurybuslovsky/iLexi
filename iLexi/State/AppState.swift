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
    var topVCStateStack: [TopViewControllerState]
    var wordGraphState: WordGraphState
}

// MARK: - Default

extension AppState {
    static var `default`: AppState { .init(topVCStateStack: [.default], wordGraphState: .default) }
}
