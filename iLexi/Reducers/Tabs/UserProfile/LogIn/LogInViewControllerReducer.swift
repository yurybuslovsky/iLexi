//
//  LogInViewControllerReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

struct LogInViewControllerReducer {

    func callAsFunction(action: Action, state: LogInViewControllerState?) -> LogInViewControllerState {
        var state = state ?? .default

        switch action {
        case is LogInViewControllerActions.LogIn:
            indicateLoggingIn(state: &state)

        case let action as LogInViewControllerActions.AsyncHandler:
            if case let .handleError(error) = action {
                handle(error: error, state: &state)
            }

        default:
            break
        }

        return state
    }

}

// MARK: - Private API

extension LogInViewControllerReducer {

    private func indicateLoggingIn(state: inout LogInViewControllerState) {

    }

    private func handle(error: Error, state: inout LogInViewControllerState) {

    }

}
