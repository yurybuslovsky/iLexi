//
//  EntryListRootState.swift
//  State_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import State

public extension iOSApp.TabBar.EntryList.Root {

    struct State: Equatable, Defaultable {
        public static var `default`: Self { .init() }
    }

}
