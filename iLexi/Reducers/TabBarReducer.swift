//
//  TabBarReducer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

struct TabBarReducer {

    func callAsFunction(action: Action, state: TabBarState?) -> TabBarState {
        var state = state ?? .default
                
        state = TabBarState(
            wordListState: WordListReducer()(action: action, state: state.wordListState),
            userProfileState: UserProfileReducer()(action: action, state: state.userProfileState)
        )

        return state
    }

}
