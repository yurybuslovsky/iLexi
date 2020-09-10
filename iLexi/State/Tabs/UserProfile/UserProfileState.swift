//
//  UserProfileState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

enum UserProfileState: Equatable {
    case root(UserProfileViewControllerState)
    case logIn(LogInViewControllerState)
    case favorites(FavoritesViewControllerState)
}
