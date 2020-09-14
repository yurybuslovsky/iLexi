//
//  LogInViewControllerActions.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

enum LogInViewControllerActions {

    // MARK: • Async business logic

    enum LogIn: Action {}

    // MARK: • Async handlers

    enum AsyncHandler: Action {
        case handleError(Error)
        case handleSuccess(user: UserFormatted, token: String)
    }

}
