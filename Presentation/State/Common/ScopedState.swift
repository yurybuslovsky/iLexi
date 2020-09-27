//
//  ScopedState.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

enum ScopedState<StateType: Equatable>: Equatable {
    case outOfScope
    case inScope(StateType)
}
