//
//  EntryInfoReducer.swift
//  Reducers_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import Actions
import Reducers
import State_iOS
import ReSwift

// MARK: - Namespace

private extension iOSApp.EntryInfo {
    typealias HandleEntryAdditionError = Actions.EntryInfo.HandleEntryAdditionError
    typealias HandleSuccessfulEntryAddition = Actions.EntryInfo.HandleSuccessfulEntryAddition
}

// MARK: - Declaration

public extension iOSApp.EntryInfo {

    struct Reducer: Reducing {

        public func mutate(state: inout State, applying action: Action) {
            switch action {
            case let action as HandleEntryAdditionError:
                state.entryAdditionResult = .error(action.error)
            case is HandleSuccessfulEntryAddition:
                state.entryAdditionResult = .success
            default:
                break
            }
        }

    }

}
