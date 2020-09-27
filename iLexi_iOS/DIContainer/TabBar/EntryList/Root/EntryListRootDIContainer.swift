//
//  EntryListRootDIContainer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import RxSwift
import ReSwift

private typealias Root = iOSApp.TabBar.EntryList.Root
private typealias DIContainer = Root.DIContainer
private typealias Controller = Root.Controller

extension Root {

    final class DIContainer {

        private let store: Store<iOSApp.State>

        private var entries: Entries {
            store.state.entries
        }

        init(store: Store<iOSApp.State>) {
            self.store = store
        }

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

        private func makeView() -> View {
            .init()
        }

        private func makeObserver() -> Observer<Controller> {
            .init(appState: store.makeObservable())
        }

    }

}

extension DIContainer: Controller.RemoveEntryUseCase.Producing {

    func makeRemoveEntryUseCase(entryIndex: Int) -> Executable {
        Controller.RemoveEntryUseCase(
            entries: entries,
            entryIndex: entryIndex,
            dispatcher: store
        )
    }

}

extension DIContainer: Controller.GoToEntryInfoUseCase.Producing {

    func makeGoToEntryInfoUseCase() -> Executable {
        Controller.GoToEntryInfoUseCase(dispatcher: store)
    }

}
