//
//  EntryInfoController.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 22.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - Interfaces

protocol EntryInfoControllerProducing {
    func makeEntryInfoController() -> UIViewController
}

protocol EntryInfoRendering: Keyboard.Rendering {}

protocol EntryInfoIXResponder: class {
    func dismiss()
    func addEntry(withValue value: String)
}

// MARK: - Auxiliary

private typealias EntryInfo = iOSApp.EntryInfo
private typealias Controller = EntryInfo.Controller

extension EntryInfo {
    typealias Producing = EntryInfoControllerProducing
    typealias IXResponder = EntryInfoIXResponder
    typealias Rendering = EntryInfoRendering
    typealias UI = UIView & Rendering
}

extension Controller {
    typealias AddEntryUseCase = UseCases.EntryInfo.AddEntryUseCase
    typealias DismissUseCase = UseCases.EntryInfo.DismissUseCase
}

// MARK: - Declaration

extension EntryInfo {

    final class Controller: BaseViewController, EventResponder, IXResponder {

        let renderer: Rendering

        private let addEntryUseCaseFactory: AddEntryUseCase.Producing
        private let dismissUseCaseFactory: DismissUseCase.Producing

        init(
            observer: Observer<Controller>,
            keyboardObserver: Keyboard.Observer<Controller>,
            ui: UI,
            addEntryUseCaseFactory: AddEntryUseCase.Producing,
            dismissUseCaseFactory: DismissUseCase.Producing
        ) {
            self.renderer = ui
            self.addEntryUseCaseFactory = addEntryUseCaseFactory
            self.dismissUseCaseFactory = dismissUseCaseFactory

            super.init(observers: [observer, keyboardObserver], uiView: ui)
        }

        override func viewWasDismissed() {
            let dismissUseCase = self.dismissUseCaseFactory.makeEntryInfoDismissUseCase()
            dismissUseCase.execute()
        }

    }

}

// MARK: - Events

extension Controller {

    func respondToSuccessfulEntryAddition() {
        dismiss()
    }

}

// MARK: - Interactions

extension Controller {

    func dismiss() {
        dismiss(animated: true)
    }

    func addEntry(withValue value: String) {
        let addEntryUseCase = addEntryUseCaseFactory.makeAddEntryUseCase(entryValue: value)
        addEntryUseCase.execute()
    }

}
