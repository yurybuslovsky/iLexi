//
//  EntryInfoController.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

// MARK: - Imports

import UIKit

import Core
import Observers
import UI
import UseCases

// MARK: - Interfaces

public protocol EntryInfoControllerProducing {
    func makeEntryInfoController() -> UIViewController
}

public protocol EntryInfoRendering: Keyboard.Rendering {}

public protocol EntryInfoIXResponder: class {
    func dismiss()
    func addEntry(withValue value: String)
}

// MARK: - Namespace

private typealias EntryInfo = iOSApp.EntryInfo
private typealias Controller = EntryInfo.Controller

public extension EntryInfo {
    typealias Producing = EntryInfoControllerProducing
    typealias IXResponder = EntryInfoIXResponder
    typealias Rendering = EntryInfoRendering
    typealias UI = UIView & Rendering
}

public extension Controller {
    typealias AddEntryUseCase = UseCases.EntryInfo.AddEntryUseCase
    typealias DismissUseCase = UseCases.EntryInfo.DismissUseCase
}

// MARK: - Declaration

public extension EntryInfo {

    final class Controller: BaseViewController, EventResponder, IXResponder {

        // MARK: • Renderer

        public let renderer: Rendering

        // MARK: • Use case factories

        private let addEntryUseCaseFactory: AddEntryUseCase.Producing
        private let dismissUseCaseFactory: DismissUseCase.Producing

        // MARK: • Initialization

        public init(
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

        // MARK: • Life cycle

        public override func viewWasDismissed() {
            let dismissUseCase = self.dismissUseCaseFactory.makeEntryInfoDismissUseCase()
            dismissUseCase.execute()
        }

    }

}

// MARK: - Events

extension Controller {

    public func respondToSuccessfulEntryAddition() {
        dismiss()
    }

}

// MARK: - Interactions

extension Controller {

    public func dismiss() {
        dismiss(animated: true)
    }

    public func addEntry(withValue value: String) {
        let addEntryUseCase = addEntryUseCaseFactory.makeAddEntryUseCase(entryValue: value)
        addEntryUseCase.execute()
    }

}
