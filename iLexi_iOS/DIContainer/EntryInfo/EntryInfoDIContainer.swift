//
//  EntryInfoDIContainer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Imports

import RxSwift
import ReSwift

import Core
import UseCases
import Entities
import Observers

// MARK: - Namespace

private typealias EntryInfo = iOSApp.EntryInfo
private typealias DIContainer = EntryInfo.DIContainer
private typealias Controller = EntryInfo.Controller

// MARK: - Declaration

extension EntryInfo {

    final class DIContainer {

        // MARK: • Private properties

        private let store: Store<iOSApp.State>

        // MARK: • Initialization

        init(store: Store<iOSApp.State>) {
            self.store = store
        }

        // MARK: • Private API

        private var entries: Entities.Graph<Entities.Entry> {
            store.state.entries
        }

        private func makeView() -> View {
            .init()
        }

        private func makeObserver() -> Observer<Controller> {
            .init(entryInfoState: store
                .makeScopedObservable { (
                    subscription: Subscription<iOSApp.State>
                ) -> Subscription<ScopedState<State>> in
                    subscription.select(EntryInfo.makeEntryInfoScopedState)
                }
            )
        }

        private func makeKeyboardObserver() -> Keyboard.Observer<Controller> {
            .init()
        }

        // MARK: • Internal API

        func makeController() -> Controller {
            let view = makeView()
            let observer = makeObserver()

            let controller = Controller(
                observer: observer,
                keyboardObserver: makeKeyboardObserver(),
                ui: view,
                addEntryUseCaseFactory: self,
                dismissUseCaseFactory: self
            )

            view.ixResponder = controller
            observer.eventResponder = controller
            return controller
        }

    }

}

// MARK: - Add Entry Use Case Producing

extension DIContainer: Controller.AddEntryUseCase.Producing {

    func makeAddEntryUseCase(entryValue: String) -> Executable {
        Controller.AddEntryUseCase(entries: entries, entryValue: entryValue, dispatcher: store)
    }

}

// MARK: - Dismiss Use Case Producing

extension DIContainer: Controller.DismissUseCase.Producing {

    func makeEntryInfoDismissUseCase() -> Executable {
        Controller.DismissUseCase(dispatcher: store)
    }

}
