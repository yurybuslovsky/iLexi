//
//  UserProfileReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

struct UserProfileReducer {

    func callAsFunction(action: Action, state: UserProfileState?) -> UserProfileState {
        var state = state ?? .default

        var stateStack = state.stateStack

        switch action {
        case is UserProfileViewControllerActions.GoToLogIn:
            stateStack.append(.logIn(.default))

        case is UserProfileViewControllerActions.GoToFavorites:
            stateStack.append(.favorites(.default))

        case let action as LogInViewControllerActions.LogIn:
            apply(action: action, to: &stateStack)

        case is UserProfileNavigationControllerActions.HandleTopVCPop:
            stateStack.removeLast()

        default:
            break
        }

        stateStack = stateStack
            .map { (userProfileNCState: UserProfileNavigationControllerState) -> UserProfileNavigationControllerState in
                UserProfileNavigationControllerReducer()(action: action, state: userProfileNCState)
            }

        state = UserProfileState(stateStack: stateStack)
        return state
    }

}

// MARK: - Private API

extension UserProfileReducer {

    private func apply(
        action: LogInViewControllerActions.LogIn,
        to stateStack: inout [UserProfileNavigationControllerState]
    ) {
        switch action {
        case let .handleSuccess(user, token):
            stateStack.removeWhileNot(
                { (userProfileNCState: UserProfileNavigationControllerState) -> Bool in
                    if case .root = userProfileNCState {
                        return true
                    }
                    
                    return false
                },
                includingNext: true
            )

            let userProfileVCState = UserProfileViewControllerState(
                authState: .authorized(user: user, token: token)
            )

            stateStack.append(.root(userProfileVCState))

        default:
            break
        }
    }

}
