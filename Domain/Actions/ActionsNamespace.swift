//
//  ActionsNamespace.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 20.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

enum Actions {}

extension iOSApp {
    typealias GoToEntryInfo = Actions.EntryList.GoToEntryInfo
    typealias DismissEntryInfo = Actions.EntryInfo.Dismiss
}

extension iOSApp.EntryInfo {
    typealias HandleError = Actions.EntryInfo.HandleError
    typealias HandleSuccessfulEntryAddition = Actions.EntryInfo.HandleSuccessfulEntryAddition
}
