//
//  UserProfileViewControllerActions.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

enum UserProfileViewControllerActions {

    // MARK: • Navigation

    enum Navigation: Action {
        case goToLogIn
        case goToFavorites
    }

    // MARK: • Sync business logic

    struct LogOut: Action {}

}
