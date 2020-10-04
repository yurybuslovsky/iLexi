//
//  EntryInfoAddEntryUseCase.swift
//  UseCases
//
//  Created by Yury Buslovsky on 29.09.2020.
//

import Entities
import Actions
import ReSwift

// MARK: - Factory protocol

public protocol EntryInfoAddEntryUseCaseProducing {
    func makeAddEntryUseCase(entryValue: String) -> Executable
}

// MARK: - Namespace

private typealias EntryInfo = UseCases.EntryInfo
private typealias AddEntryUseCase = EntryInfo.AddEntryUseCase

public extension AddEntryUseCase {
    typealias Producing = EntryInfoAddEntryUseCaseProducing
    typealias Error = Actions.EntryInfo.Error
}

// MARK: - Declaration

public extension EntryInfo {

    final class AddEntryUseCase: BaseUseCase {

        private let entries: Graph<Entry>
        private let entryValue: String

        public init(entries: Graph<Entry>, entryValue: String, dispatcher: Dispatching) {
            self.entries = entries
            self.entryValue = entryValue
            super.init(dispatch: dispatcher)
        }

        public func execute() {
            let action: Action

            do {
                let newEntry = Entry(value: entryValue)
                try append(uniqueEntry: newEntry)
                action = Actions.HandleSuccessfulEntryAddition()
            } catch let error as Error {
                action = Actions.HandleEntryAdditionError(error: error)
            } catch {
                fatalError("Unexpected error")
            }

            dispatch(action)
        }

    }

}

// MARK: - Private API

extension AddEntryUseCase {

    private func append(uniqueEntry: Entry) throws {
        if entries.contains(uniqueEntry) {
            throw Error.alreadyExists
        }

        entries.append(uniqueEntry)
    }

}
