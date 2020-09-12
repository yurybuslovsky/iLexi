//
//  UserProfileNavigationControllerState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

enum UserProfileNavigationControllerState: Equatable {
    case root(UserProfileViewControllerState)
    case logIn(LogInViewControllerState)
    case favorites(FavoritesViewControllerState)
}

// MARK: - Default

extension UserProfileNavigationControllerState {
    static var `default`: UserProfileNavigationControllerState { .root(.default) }
}
