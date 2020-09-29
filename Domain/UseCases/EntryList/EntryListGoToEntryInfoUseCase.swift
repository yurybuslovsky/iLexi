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

// MARK: - Namespace

extension UseCases.EntryList.GoToEntryInfoUseCase {
    typealias Producing = EntryListGoToEntryInfoUseCaseProducing
}

// MARK: - Declaration

extension UseCases.EntryList {

    final class GoToEntryInfoUseCase: BaseUseCase {

        init(dispatcher: Dispatching) {
            super.init(dispatch: dispatcher)
        }

        func execute() {
            let action = Actions.GoToEntryInfo()
            dispatch(action)
        }

    }

}
