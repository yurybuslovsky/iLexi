//
//  EntryListController.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import UseCases
import UI
import Entities
import UIKit

// MARK: - Interfaces

public protocol EntryListRendering {
    func render(entries: [Entities.Entry])
}

public protocol EntryListIXResponder: class {
    func removeEntry(at index: Int)
}

// MARK: - Auxiliary

private typealias Root = iOSApp.TabBar.EntryList.Root
private typealias Controller = Root.Controller

public extension Root {
    typealias IXResponder = EntryListIXResponder
    typealias Rendering = EntryListRendering
    typealias UI = UITableView & Rendering
}

extension Controller {
    public typealias RemoveEntryUseCase = UseCases.EntryList.RemoveEntryUseCase
    public typealias GoToEntryInfoUseCase = UseCases.EntryList.GoToEntryInfoUseCase
    private typealias L10n = Core.L10n.EntryList
}

// MARK: - Declaration

public extension Root {

    final class Controller: BaseTableViewController, EventResponder, IXResponder {

        private let renderer: Rendering

        private let removeEntryUseCaseFactory: RemoveEntryUseCase.Producing
        private let goToEntryInfoUseCaseFactory: GoToEntryInfoUseCase.Producing

        public init(
            observer: Observer<Controller>,
            ui: UI,
            removeEntryUseCaseFactory: RemoveEntryUseCase.Producing,
            goToEntryInfoUseCaseFactory: GoToEntryInfoUseCase.Producing
        ) {
            self.renderer = ui
            self.removeEntryUseCaseFactory = removeEntryUseCaseFactory
            self.goToEntryInfoUseCaseFactory = goToEntryInfoUseCaseFactory

            super.init(observers: [observer], uiTableView: ui)

            setUpUI()
        }

    }

}

// MARK: - Private API

extension Controller {

    private func setUpUI() {
        navigationItem.title = L10n.title

        let addEntryBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        addEntryBarButtonItem.setAction { [unowned self] in self.goToEntry() }
        navigationItem.rightBarButtonItem = addEntryBarButtonItem
    }

}

// MARK: - Events

extension Controller {

    public func respondTo(newEntries: [Entities.Entry]) {
        renderer.render(entries: newEntries)
    }

}

// MARK: - Interactions

extension Controller {

    private func goToEntry() {
        let goToEntryInfoUseCase = goToEntryInfoUseCaseFactory.makeGoToEntryInfoUseCase()
        goToEntryInfoUseCase.execute()
    }

    public func removeEntry(at index: Int) {
        let removeEntryUseCase = removeEntryUseCaseFactory.makeRemoveEntryUseCase(entryIndex: index)
        removeEntryUseCase.execute()
    }

}
