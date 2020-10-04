//
//  TabBarDIContainer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Imports

import RxSwift
import ReSwift

import Core

// MARK: - Declaration

extension iOSApp.TabBar {

    final class DIContainer {

        // MARK: • Private properties

        private let store: Store<iOSApp.State>
        private let entryInfoVCFactory: iOSApp.EntryInfo.Producing

        // MARK: • Initialization

        init(store: Store<iOSApp.State>, entryInfoVCFactory: iOSApp.EntryInfo.Producing) {
            self.store = store
            self.entryInfoVCFactory = entryInfoVCFactory
        }

        // MARK: • Private API

        private func makeObserver() -> Observer<Controller> {
            .init(appState: store.makeObservable())
        }

        private func makeEntryListNavigationController() -> EntryList.NavigationController {
            EntryList.DIContainer(store: store).makeNavigationController()
        }

        // MARK: • Internal API

        func makeController() -> Controller {
            let observer = makeObserver()

            let controller = Controller(
                observer: observer,
                entryListNC: makeEntryListNavigationController(),
                entryInfoVCFactory: entryInfoVCFactory
            )

            observer.eventResponder = controller
            return controller
        }

    }

}
