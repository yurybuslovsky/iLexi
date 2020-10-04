//
//  EntryListController.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

// MARK: - Imports

import UIKit

import Core
import UseCases
import UI
import Entities

// MARK: - Interfaces

public protocol EntryListRendering {
    func render(entries: [Entry])
}

public protocol EntryListIXResponder: class {
    func removeEntry(at index: Int)
}

// MARK: - Namespace

private typealias Root = iOSApp.TabBar.EntryList.Root
private typealias Controller = Root.Controller

public extension Root {
    typealias IXResponder = EntryListIXResponder
    typealias Rendering = EntryListRendering
    typealias UI = UITableView & Rendering
}

extension Controller {
    private typealias L10n = Core.L10n.EntryList
}

public extension Controller {
    typealias RemoveEntryUseCase = UseCases.EntryList.RemoveEntryUseCase
    typealias GoToEntryInfoUseCase = UseCases.EntryList.GoToEntryInfoUseCase
}

// MARK: - Declaration

public extension Root {

    final class Controller: BaseTableViewController, EventResponder, IXResponder {

        // MARK: • Renderer

        private let renderer: Rendering

        // MARK: • Use case factories

        private let removeEntryUseCaseFactory: RemoveEntryUseCase.Producing
        private let goToEntryInfoUseCaseFactory: GoToEntryInfoUseCase.Producing

        // MARK: • Initialization

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

    public func respondTo(newEntries: [Entry]) {
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
