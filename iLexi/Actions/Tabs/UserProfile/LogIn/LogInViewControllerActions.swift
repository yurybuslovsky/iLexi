//
//  LogInViewControllerActions.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

enum LogInViewControllerActions {

    enum LogIn: Action {
        case start
        case handleError(Error)
        case handleSuccess(user: UserFormatted, token: String)
    }

}
