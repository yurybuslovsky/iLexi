//
//  BaseUseCase.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

class BaseUseCase {
    let dispatch: Dispatcher

    init(dispatch: Dispatcher) {
        self.dispatch = dispatch
    }
}
