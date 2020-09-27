//
//  EntryInfoAddEntryUseCase.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

// MARK: - Factory protocol

protocol EntryInfoAddEntryUseCaseProducing {
    func makeAddEntryUseCase(entryValue: String) -> Executable
}

// MARK: - Namespace

private typealias AddEntryUseCase = UseCases.EntryInfo.AddEntryUseCase

extension AddEntryUseCase {
    typealias Producing = EntryInfoAddEntryUseCaseProducing
}

// MARK: - Declaration

extension UseCases.EntryInfo {

    final class AddEntryUseCase: BaseUseCase {

        private let entries: Entries
        private let entryValue: String

        init(entries: Entries, entryValue: String, dispatcher: Dispatching) {
            self.entries = entries
            self.entryValue = entryValue
            super.init(dispatch: dispatcher)
        }

        func execute() {
            let action: Action

            do {
                let newEntry = Entry(value: entryValue)
                try append(uniqueEntry: newEntry)
                action = Actions.HandleSuccessfulEntryAddition()
            } catch let error as Entry.Error {
                action = Actions.HandleError(entryError: error)
            } catch {
                fatalError()
            }

            dispatch(action)
        }

    }

}

// MARK: - Private API

extension AddEntryUseCase {

    private func append(uniqueEntry: Entry) throws {
        if entries.contains(uniqueEntry) {
            throw Entry.Error.alreadyExists
        }

        entries.append(uniqueEntry)
    }

}
