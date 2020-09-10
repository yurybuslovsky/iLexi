//
//  RootState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

enum RootState: StateType, Equatable {

    // MARK: • Tabs

    case wordList(WordListState)
    case userProfile(UserProfileState)

    // MARK: • Common

    case newWord(NewWordViewControllerState)
}
