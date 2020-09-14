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

        stateStack = stateStack
            .map { (userProfileNCState: UserProfileNavigationControllerState) -> UserProfileNavigationControllerState in
                UserProfileNavigationControllerReducer()(action: action, state: userProfileNCState)
            }

        state.authState = AuthReducer()(action: action, state: state.authState)
        state.wordGraphState = WordGraphReducer()(action: action, state: state.wordGraphState)

        switch action {
        case let action as UserProfileViewControllerActions.Navigation:
            apply(action: action, to: &stateStack, given: state)

        case is UserProfileNavigationControllerActions.HandleTopVCPop:
            stateStack.removeLast()

        default:
            break
        }

        state.stateStack = stateStack
        return state
    }

}

// MARK: - Private API

extension UserProfileReducer {

    private func apply(
        action: UserProfileViewControllerActions.Navigation,
        to stateStack: inout [UserProfileNavigationControllerState],
        given state: UserProfileState
    ) {
        switch action {
        case .goToLogIn:
            stateStack.append(.logIn(.default))

        case .goToFavorites:
            stateStack.append(.favorites(FavoritesViewControllerState(
                authState: state.authState,
                wordGraphState: state.wordGraphState
            )))
        }
    }

}
