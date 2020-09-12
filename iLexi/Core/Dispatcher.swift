//
//  Dispatcher.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

protocol Dispatcher {
    func dispatch(_ action: Action)
}

extension Store: Dispatcher {}
