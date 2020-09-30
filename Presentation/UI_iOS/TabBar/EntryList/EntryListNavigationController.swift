//
//  EntryListNavigationController.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import UIKit
import SwiftUI

// MARK: - Auxiliary

private typealias EntryList = iOSApp.TabBar.EntryList
private typealias Root = EntryList.Root
private typealias NavigationController = EntryList.NavigationController

extension NavigationController {
    typealias L10n = Core.L10n.EntryList
}

// MARK: - Declaration

extension EntryList {

    final class NavigationController: NiblessNavigationController {

        private let rootVC: Root.Controller

        init(rootVC: Root.Controller) {
            self.rootVC = rootVC
            super.init()
            setUpUI()
        }

    }

}

// MARK: - Private API

extension NavigationController {

    private func setUpUI() {
        tabBarItem.title = L10n.title
        pushViewController(rootVC, animated: false)
    }

}
