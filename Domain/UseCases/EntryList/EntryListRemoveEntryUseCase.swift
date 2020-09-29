//
//  EntryListRemoveEntryUseCase.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Factory protocol

protocol EntryListRemoveEntryUseCaseProducing {
    func makeRemoveEntryUseCase(entryIndex: Int) -> Executable
}

// MARK: - Namespace

extension UseCases.EntryList.RemoveEntryUseCase {
    typealias Producing = EntryListRemoveEntryUseCaseProducing
}

// MARK: - Declaration

extension UseCases.EntryList {

    final class RemoveEntryUseCase: BaseUseCase {

        private let entries: Entries
        private let entryIndex: Int

        init(entries: Entries, entryIndex: Int, dispatcher: Dispatching) {
            self.entries = entries
            self.entryIndex = entryIndex
            super.init(dispatch: dispatcher)
        }

        func execute() {
            entries.remove(at: entryIndex)
            let action = Actions.HandleSuccessfulEntryRemoval()
            dispatch(action)
        }

    }

}
