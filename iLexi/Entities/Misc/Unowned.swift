//
//  Unowned.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

struct Unowned<T: AnyObject> {
    private unowned let value: T

    init(_ value: T) {
        self.value = value
    }
}
