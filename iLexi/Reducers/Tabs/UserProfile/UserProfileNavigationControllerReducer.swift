//
//  UserProfileNavigationControllerReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct UserProfileNavigationControllerReducer {

    func callAsFunction(
        action: Action,
        state: UserProfileNavigationControllerState?
    ) -> UserProfileNavigationControllerState {
        var state = state ?? .default

        switch state {
        case let .root(wordListViewControllerState):
            state = .root(UserProfileViewControllerReducer()(action: action, state: wordListViewControllerState))
        case let .logIn(logInViewControllerState):
            state = .logIn(LogInViewControllerReducer()(action: action, state: logInViewControllerState))
        case let .favorites(favoritesViewControllerState):
            state = .favorites(FavoritesViewControllerReducer()(action: action, state: favoritesViewControllerState))
        }

        return state
    }

}
