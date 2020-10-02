//
//  TabBarReducer.swift
//  Reducers_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import Reducers
import State
import ReSwift

public extension iOSApp.TabBar {

    struct Reducer: Reducing {

        public func mutate(state: inout State, applying action: Action) {
            var newEntryListState = state.entryListState

            switch newEntryListState {
            case let .entryList(entryListState):
                newEntryListState = .entryList(EntryList.Reducer()(action: action, state: entryListState))
            }

            state.entryListState = newEntryListState
        }

    }

}
