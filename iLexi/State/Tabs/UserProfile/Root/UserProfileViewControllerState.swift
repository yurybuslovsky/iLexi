//
//  UserProfileViewControllerState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct UserProfileViewControllerState: Equatable {
    let authState: AuthState
}

// MARK: - Default

extension UserProfileViewControllerState {
    static var `default`: UserProfileViewControllerState { .init(authState: .unauthorized) }
}
