//
//  TopViewControllerReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct TopViewControllerReducer {

    func callAsFunction(action: Action, state: TopViewControllerState?) -> TopViewControllerState {
        var state = state ?? .default

        switch state {
        case let .tabBar(tabBarState):
            state = .tabBar(TabBarReducer()(action: action, state: tabBarState))
        case let .newWord(newWordViewControllerState):
            state = .newWord(NewWordViewControllerReducer()(action: action, state: newWordViewControllerState))
        }

        return state
    }

}
