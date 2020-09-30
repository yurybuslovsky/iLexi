//
//  iOSEntryInfoReducer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 18.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import Actions
import ReSwift

// MARK: - Namespace

extension iOSApp.EntryInfo {
    typealias HandleEntryAdditionError = Actions.EntryInfo.HandleEntryAdditionError
    typealias HandleSuccessfulEntryAddition = Actions.EntryInfo.HandleSuccessfulEntryAddition
}

// MARK: - Declaration

extension iOSApp.EntryInfo {

    struct Reducer: Reducing {

        func mutate(state: inout State, applying action: Action) {
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
