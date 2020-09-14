//
//  AuthReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

struct AuthReducer {

    func callAsFunction(action: Action, state: AuthState?) -> AuthState {
        var state = state ?? .default

        switch action {
        case let action as LogInViewControllerActions.AsyncHandler:
            apply(action: action, to: &state)
        case is UserProfileViewControllerActions.LogOut:
            state = .unauthorized
        default:
            break
        }

        return state
    }

}

extension AuthReducer {

    private func apply(
        action: LogInViewControllerActions.AsyncHandler,
        to state: inout AuthState
    ) {
        switch action {
        case let .handleSuccess(user, token):
            state = .authorized(user: user, token: token)
        default:
            break
        }
    }

}
