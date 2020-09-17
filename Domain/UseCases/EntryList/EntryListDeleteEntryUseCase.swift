//
//  EntryListDeleteEntryUseCase.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Factory protocol

protocol EntryListDeleteEntryUseCaseProducing {
    func makeDeleteEntryUseCase() -> Executable
}

extension UseCases.EntryList.DeleteEntryUseCase {
    typealias Producing = EntryListDeleteEntryUseCaseProducing
}

// MARK: - Declaration

extension UseCases.EntryList {

    final class DeleteEntryUseCase: UseCase {
        private let entryIndex: Int

        init(entryIndex: Int, dispatcher: Dispatcher) {
            self.entryIndex = entryIndex
            super.init(dispatch: dispatcher)
        }

        func execute() {
            let action = Actions.DeleteEntry(entryIndex: entryIndex)
            dispatch(action)
        }
    }

}
