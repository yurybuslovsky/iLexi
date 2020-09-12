//
//  AuthState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

enum AuthState: Equatable {
    case unauthorized
    case authorized(user: UserFormatted, token: String)
}

// MARK: - Default

extension AuthState {
    static var `default`: AuthState { .unauthorized }
}
