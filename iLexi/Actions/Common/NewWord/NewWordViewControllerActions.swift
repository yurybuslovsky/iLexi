//
//  NewWordViewControllerActions.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

enum NewWordViewControllerActions {

    struct Cancel: Action {}

    struct SaveNewWord: Action {
        let newWord: EntryFormatted
    }

}
