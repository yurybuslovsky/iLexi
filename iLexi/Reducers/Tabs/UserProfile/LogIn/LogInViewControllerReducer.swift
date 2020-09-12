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
        case let action as LogInViewControllerActions.LogIn:
            switch action {
            case .start:
                indicateLoggingIn(state: &state)
            case let .handleError(error):
                handle(error: error, state: &state)
            default:
                break
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
