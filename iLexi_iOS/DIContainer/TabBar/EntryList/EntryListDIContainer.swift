//
//  EntryListDIContainer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

extension iOSApp.TabBar.EntryList {

    final class DIContainer {

        private let store: Store<iOSApp.State>

        init(store: Store<iOSApp.State>) {
            self.store = store
        }

        func makeNavigationController() -> NavigationController {
            .init(rootVC: makeRootController())
        }

        private func makeRootController() -> Root.Controller {
            Root.DIContainer(store: store).makeController()
        }

    }

}
