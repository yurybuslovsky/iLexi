//
//  iOSTabBarReducer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 18.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import ReSwift

extension iOSApp.TabBar {

    struct Reducer: Reducing {

        func mutate(state: inout State, applying action: Action) {
            var newEntryListState = state.entryListState

            switch newEntryListState {
            case let .entryList(entryListState):
                newEntryListState = .entryList(EntryList.Reducer()(action: action, state: entryListState))
            }

            state.entryListState = newEntryListState
        }

    }

}
