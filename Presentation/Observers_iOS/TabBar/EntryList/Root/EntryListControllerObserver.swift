//
//  EntryListControllerObserver.swift
//  Observers_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import Observers

public extension iOSApp.TabBar.EntryList.Root {
    typealias Observer = EntriesObserver
    typealias EventResponder = EntriesEventResponder
}
