//
//  TabBarController.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import UI
import Observers_iOS
import UIKit

// MARK: - Auxiliary

private typealias TabBar = iOSApp.TabBar
private typealias Controller = TabBar.Controller
private typealias EntryList = TabBar.EntryList

// MARK: - Declaration

public extension TabBar {

    final class Controller: NiblessTabBarController, EventResponder {

        private let observer: Observer<Controller>
        private let entryListNC: EntryList.NavigationController
        private let entryInfoVCFactory: iOSApp.EntryInfo.Producing

        public init(
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

        public override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            observer.startObserving()
        }

        public override func viewDidDisappear(_ animated: Bool) {
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

    public func respondToEntryInfoPresentation() {
        let entryInfoVC = entryInfoVCFactory.makeEntryInfoController()
        present(entryInfoVC, animated: true)
    }

}
