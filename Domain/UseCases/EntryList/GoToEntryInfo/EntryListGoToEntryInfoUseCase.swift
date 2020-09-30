//
//  EntryListGoToEntryInfoUseCase.swift
//  UseCases
//
//  Created by Yury Buslovsky on 29.09.2020.
//

// MARK: - Factory protocol

public protocol EntryListGoToEntryInfoUseCaseProducing {
    func makeGoToEntryInfoUseCase() -> Executable
}

// MARK: - Namespace

public extension UseCases.EntryList.GoToEntryInfoUseCase {
    typealias Producing = EntryListGoToEntryInfoUseCaseProducing
}

// MARK: - Declaration

public extension UseCases.EntryList {

    final class GoToEntryInfoUseCase: BaseUseCase {

        public init(dispatcher: Dispatching) {
            super.init(dispatch: dispatcher)
        }

        public func execute() {
            let action = Actions.GoToEntryInfo()
            dispatch(action)
        }

    }

}
