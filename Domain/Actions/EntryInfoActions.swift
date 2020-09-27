//
//  EntryInfoActions.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

extension Actions {

    enum EntryInfo {

        struct HandleSuccessfulEntryAddition: Action {}

        struct HandleError: Action {
            let entryError: Entry.Error
        }

        struct Dismiss: Action {}

    }

}
