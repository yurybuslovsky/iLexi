//
//  TabBarActions.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Declaration

enum TabBarActions {

    // MARK: • Navigation

    struct ChangeTab: Action {
        let newTab: Tab

        enum Tab {
            case wordList
            case userProfile
        }
    }

}
