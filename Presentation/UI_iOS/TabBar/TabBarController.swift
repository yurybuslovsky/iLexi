//
//  TabBarController.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import UIKit
import SwiftUI

// MARK: - Auxiliary

private typealias TabBar = iOSApp.TabBar
private typealias Controller = TabBar.Controller
private typealias EntryList = TabBar.EntryList

// MARK: - Declaration

extension TabBar {

    final class Controller: NiblessTabBarController, EventResponder {

        private let observer: Observer<Controller>
        private let entryListNC: EntryList.NavigationController
        private let entryInfoVCFactory: iOSApp.EntryInfo.Producing

        init(
            observer: Observer<Controller>,
            entryListNC: EntryList.NavigationController,
            entryInfoVCFactory: iOSApp.EntryInfo.Producing
        ) {
            self.observer = observer
            self.entryListNC = entryListNC
            self.entryInfoVCFactory = entryInfoVCFactory

            super.init()

            setUpView()
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            observer.startObserving()
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            observer.stopObserving()
        }

    }

}

// MARK: - Private API

extension Controller {

    private func setUpView() {
        setViewControllers(
            [
                entryListNC,
            ],
            animated: false
        )
    }

}

// MARK: - Events

extension Controller {

    func respondToEntryInfoPresentation() {
        let entryInfoVC = entryInfoVCFactory.makeEntryInfoController()
        present(entryInfoVC, animated: true)
    }

}
