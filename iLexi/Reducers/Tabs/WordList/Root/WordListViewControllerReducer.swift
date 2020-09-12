//
//  WordListViewControllerReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct WordListViewControllerReducer {

    func callAsFunction(action: Action, state: WordListViewControllerState?) -> WordListViewControllerState {
        var state = state ?? .default

        switch action {
        default:
            break
        }

        return state
    }

}
