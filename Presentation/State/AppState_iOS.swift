//
//  AppState_iOS.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

// swiftlint:disable type_name
struct AppState_iOS: StateType, Equatable {
    var topVCStateStack: [TopViewControllerState]
    var entries: [Entities.Entry.Formatted]
}
// swiftlint:enable type_name

// MARK: - Default

extension AppState_iOS {
    static var `default`: AppState_iOS { .init(topVCStateStack: [.default], entries: []) }
}
