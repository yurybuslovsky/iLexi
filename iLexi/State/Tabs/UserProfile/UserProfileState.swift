//
//  UserProfileState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct UserProfileState: Equatable {
    var stateStack: [UserProfileNavigationControllerState]
    var authState: AuthState
    var wordGraphState: WordGraphState
}

// MARK: - Default

extension UserProfileState {
    static var `default`: UserProfileState { .init(
        stateStack: [.default],
        authState: .default,
        wordGraphState: .default
    )}
}
