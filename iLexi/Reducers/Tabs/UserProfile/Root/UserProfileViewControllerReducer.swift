//
//  UserProfileViewControllerReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct UserProfileViewControllerReducer {

    func callAsFunction(action: Action, state: UserProfileViewControllerState?) -> UserProfileViewControllerState {
        var state = state ?? .default

        state.authState = AuthReducer()(action: action, state: state.authState)

        return state
    }

}
