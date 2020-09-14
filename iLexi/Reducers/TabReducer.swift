//
//  TabReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct TabReducer {

    func callAsFunction(action: Action, state: TabState?) -> TabState {
        var state = state ?? .default

        switch state {
        case let .wordList(wordListState):
            state = .wordList(WordListReducer()(action: action, state: wordListState))
        case let .userProfile(userProfileState):
            state = .userProfile(UserProfileReducer()(action: action, state: userProfileState))
        }

        return state
    }

}
