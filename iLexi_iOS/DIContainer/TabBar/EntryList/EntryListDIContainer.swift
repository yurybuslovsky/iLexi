//
//  EntryListDIContainer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Imports

import ReSwift

import Core

// MARK: - Declaration

extension iOSApp.TabBar.EntryList {

    final class DIContainer {

        // MARK: • Private properties

        private let store: Store<iOSApp.State>

        // MARK: • Initialization

        init(store: Store<iOSApp.State>) {
            self.store = store
        }

        // MARK: • Private API

        private func makeRootController() -> Root.Controller {
            Root.DIContainer(store: store).makeController()
        }

        // MARK: • Internal API

        func makeNavigationController() -> NavigationController {
            .init(rootVC: makeRootController())
        }

    }

}
