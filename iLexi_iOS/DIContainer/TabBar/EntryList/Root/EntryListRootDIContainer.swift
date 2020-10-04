//
//  EntryListRootDIContainer.swift
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

// MARK: - Namespace

private typealias Root = iOSApp.TabBar.EntryList.Root
private typealias DIContainer = Root.DIContainer
private typealias Controller = Root.Controller

// MARK: - Declaration

extension Root {

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
            .init(appState: store.makeObservable())
        }

        // MARK: • Internal API

        func makeController() -> Controller {
            let view = makeView()
            let observer = makeObserver()

            let controller = Controller(
                observer: observer,
                ui: view,
                removeEntryUseCaseFactory: self,
                goToEntryInfoUseCaseFactory: self
            )

            view.ixResponder = controller
            observer.eventResponder = controller
            return controller
        }

    }

}

// MARK: - Remove Entry Use Case Producing

extension DIContainer: Controller.RemoveEntryUseCase.Producing {

    func makeRemoveEntryUseCase(entryIndex: Int) -> Executable {
        Controller.RemoveEntryUseCase(
            entries: entries,
            entryIndex: entryIndex,
            dispatcher: store
        )
    }

}

// MARK: - Go To Entry Info Use Case Producing

extension DIContainer: Controller.GoToEntryInfoUseCase.Producing {

    func makeGoToEntryInfoUseCase() -> Executable {
        Controller.GoToEntryInfoUseCase(dispatcher: store)
    }

}
