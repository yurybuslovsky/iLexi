//
//  EntryInfoDismissUseCase.swift
//  UseCases
//
//  Created by Yury Buslovsky on 29.09.2020.
//

// MARK: - Factory protocol

public protocol EntryInfoDismissUseCaseProducing {
    func makeEntryInfoDismissUseCase() -> Executable
}

// MARK: - Namespace

public extension UseCases.EntryInfo.DismissUseCase {
    typealias Producing = EntryInfoDismissUseCaseProducing
}

// MARK: - Declaration

public extension UseCases.EntryInfo {

    final class DismissUseCase: BaseUseCase {

        public init(dispatcher: Dispatching) {
            super.init(dispatch: dispatcher)
        }

        public func execute() {
            let action = Actions.Dismiss()
            dispatch(action)
        }

    }

}
