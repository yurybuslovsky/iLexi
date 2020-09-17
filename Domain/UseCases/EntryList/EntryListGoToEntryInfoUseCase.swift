//
//  EntryListGoToEntryInfoUseCase.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Factory protocol

protocol EntryListGoToEntryInfoUseCaseProducing {
    func makeGoToEntryInfoUseCase() -> Executable
}

extension UseCases.EntryList.GoToEntryInfoUseCase {
    typealias Producing = EntryListGoToEntryInfoUseCaseProducing
}

// MARK: - Declaration

extension UseCases.EntryList {

    final class GoToEntryInfoUseCase: UseCase {
        func execute() {
            let action = Actions.GoToEntryInfo()
            dispatch(action)
        }
    }

}
