//
//  UserProfileState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct UserProfileState: Equatable {
    let stateStack: [UserProfileNavigationControllerState]

    init(stateStack: [UserProfileNavigationControllerState] = [.default]) {
        self.stateStack = stateStack
    }
}

// MARK: - Default

extension UserProfileState {
    static var `default`: UserProfileState { .init() }
}
