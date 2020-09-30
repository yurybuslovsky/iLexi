//
//  EntryListController.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import UseCases
import UIKit
import SwiftUI

// MARK: - Interfaces

protocol EntryListRendering {
    func render(entries: [Entry])
}

protocol EntryListIXResponder: class {
    func removeEntry(at index: Int)
}

// MARK: - Auxiliary

private typealias Root = iOSApp.TabBar.EntryList.Root
private typealias Controller = Root.Controller

extension Root {
    typealias IXResponder = EntryListIXResponder
    typealias Rendering = EntryListRendering
    typealias UI = UITableView & Rendering
}

extension Controller {
    typealias RemoveEntryUseCase = UseCases.EntryList.RemoveEntryUseCase
    typealias GoToEntryInfoUseCase = UseCases.EntryList.GoToEntryInfoUseCase
    typealias L10n = Core.L10n.EntryList
}

// MARK: - Declaration

extension Root {

    final class Controller: BaseTableViewController, EventResponder, IXResponder {

        private let renderer: Rendering

        private let removeEntryUseCaseFactory: RemoveEntryUseCase.Producing
        private let goToEntryInfoUseCaseFactory: GoToEntryInfoUseCase.Producing

        init(
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

    func respondTo(newEntries: [Entry]) {
        renderer.render(entries: newEntries)
    }

}

// MARK: - Interactions

extension Controller {

    private func goToEntry() {
        let goToEntryInfoUseCase = goToEntryInfoUseCaseFactory.makeGoToEntryInfoUseCase()
        goToEntryInfoUseCase.execute()
    }

    func removeEntry(at index: Int) {
        let removeEntryUseCase = removeEntryUseCaseFactory.makeRemoveEntryUseCase(entryIndex: index)
        removeEntryUseCase.execute()
    }

}
