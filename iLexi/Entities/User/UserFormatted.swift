//
//  UserFormatted.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct UserFormatted {

    let id: String
    let firstName: String
    let lastName: String

    init(
        id: String,
        firstName: String,
        lastName: String
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }

}

// MARK: - Equatable

extension UserFormatted: Equatable {

    static func == (lhs: UserFormatted, rhs: UserFormatted) -> Bool {
        lhs.id == rhs.id
    }

}

// MARK: - Formatting

extension UserFormatted {

    init(rawUser: UserRaw) {
        self.init(
            id: rawUser.id,
            firstName: rawUser.firstName,
            lastName: rawUser.lastName
        )
    }

}
