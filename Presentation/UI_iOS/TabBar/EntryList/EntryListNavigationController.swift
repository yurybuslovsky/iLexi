//
//  EntryListNavigationController.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import UI
import UIKit

// MARK: - Auxiliary

private typealias EntryList = iOSApp.TabBar.EntryList
private typealias Root = EntryList.Root
private typealias NavigationController = EntryList.NavigationController

extension NavigationController {
    typealias L10n = Core.L10n.EntryList
}

// MARK: - Declaration

public extension EntryList {

    final class NavigationController: NiblessNavigationController {

        private let rootVC: Root.Controller

        public init(rootVC: Root.Controller) {
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
