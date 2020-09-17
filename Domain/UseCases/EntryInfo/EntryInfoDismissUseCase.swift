//
//  EntryInfoDismissUseCase.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Factory protocol

protocol EntryInfoDismissUseCaseProducing {
    func makeEntryInfoDismissUseCase() -> Executable
}

extension UseCases.EntryInfo.DismissUseCase {
    typealias Producing = EntryInfoDismissUseCaseProducing
}

// MARK: - Declaration

extension UseCases.EntryInfo {

    final class DismissUseCase: UseCase {
        func execute() {
            let action = Actions.Dismiss()
            dispatch(action)
        }
    }

}
