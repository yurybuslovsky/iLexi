//
//  EntryInfoAddEntryUseCase.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Factory protocol

protocol EntryInfoAddEntryUseCaseProducing {
    func makeAddEntryUseCase() -> Executable
}

extension UseCases.EntryInfo.AddEntryUseCase {
    typealias Producing = EntryInfoAddEntryUseCaseProducing
}

// MARK: - Declaration

extension UseCases.EntryInfo {

    final class AddEntryUseCase: UseCase {
        let entryValue: String

        init(entryValue: String, dispatcher: Dispatcher) {
            self.entryValue = entryValue
            super.init(dispatch: dispatcher)
        }

        func execute() {
            let action = Actions.AddEntry(entryValue: entryValue)
            dispatch(action)
        }
    }

}
