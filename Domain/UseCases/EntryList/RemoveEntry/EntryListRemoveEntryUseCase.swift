//
//  EntryListRemoveEntryUseCase.swift
//  UseCases
//
//  Created by Yury Buslovsky on 29.09.2020.
//

import Entities

// MARK: - Factory protocol

public protocol EntryListRemoveEntryUseCaseProducing {
    func makeRemoveEntryUseCase(entryIndex: Int) -> Executable
}

// MARK: - Namespace

public extension UseCases.EntryList.RemoveEntryUseCase {
    typealias Producing = EntryListRemoveEntryUseCaseProducing
}

// MARK: - Declaration

public extension UseCases.EntryList {

    final class RemoveEntryUseCase: BaseUseCase {

        private let entries: Entities.Graph<Entities.Entry>
        private let entryIndex: Int

        public init(entries: Entities.Graph<Entities.Entry>, entryIndex: Int, dispatcher: Dispatching) {
            self.entries = entries
            self.entryIndex = entryIndex
            super.init(dispatch: dispatcher)
        }

        public func execute() {
            entries.remove(at: entryIndex)
            let action = Actions.HandleSuccessfulEntryRemoval()
            dispatch(action)
        }

    }

}
