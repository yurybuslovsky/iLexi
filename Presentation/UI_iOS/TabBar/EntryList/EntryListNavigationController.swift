//
//  EntryListNavigationController.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

// MARK: - Imports

import UIKit

import Core
import UI

// MARK: - Namespace

private typealias EntryList = iOSApp.TabBar.EntryList
private typealias Root = EntryList.Root
private typealias NavigationController = EntryList.NavigationController

extension NavigationController {
    private typealias L10n = Core.L10n.EntryList
}

// MARK: - Declaration

public extension EntryList {

    final class NavigationController: NiblessNavigationController {

        // MARK: • Children

        private let rootVC: Root.Controller

        // MARK: • Initialization

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
