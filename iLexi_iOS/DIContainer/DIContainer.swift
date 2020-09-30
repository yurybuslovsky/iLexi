//
//  DIContainer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 25.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import ReSwift
import RxSwift
import UIKit

private typealias DIContainer = iOSApp.DIContainer
private typealias EntryInfo = iOSApp.EntryInfo

// MARK: - Declaration

extension iOSApp {

    final class DIContainer {

        private let store: Store<State> = .init(
            reducer: Reducer().callAsFunction,
            state: .default,
            automaticallySkipsRepeats: false
        )

        func makeRootViewController() -> UIViewController {
            TabBar.DIContainer(store: store, entryInfoVCFactory: self).makeController()
        }

    }

}

// MARK: - Entry Info Producing

extension DIContainer: EntryInfo.Producing {

    func makeEntryInfoController() -> UIViewController {
        EntryInfo.DIContainer(store: store).makeController()
    }

}
