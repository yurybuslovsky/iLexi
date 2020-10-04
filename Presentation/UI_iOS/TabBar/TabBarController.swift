//
//  TabBarController.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

// MARK: - Imports

import UIKit

import Core
import UI
import Observers_iOS

// MARK: - Namespace

private typealias TabBar = iOSApp.TabBar
private typealias Controller = TabBar.Controller
private typealias EntryList = TabBar.EntryList

// MARK: - Declaration

public extension TabBar {

    final class Controller: NiblessTabBarController, EventResponder {

        // MARK: • Observer

        private let observer: Observer<Controller>

        // MARK: • Children

        private let entryListNC: EntryList.NavigationController

        // MARK: • Modal facroties

        private let entryInfoVCFactory: iOSApp.EntryInfo.Producing

        // MARK: • Initialization

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

        // MARK: • Life cycle

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
