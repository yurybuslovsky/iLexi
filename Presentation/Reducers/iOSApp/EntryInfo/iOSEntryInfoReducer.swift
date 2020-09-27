//
//  iOSEntryInfoReducer.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 18.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import ReSwift

extension iOSApp.EntryInfo {

    struct Reducer: Reducing {

        func mutate(state: inout State, applying action: Action) {
            switch action {
            case let action as HandleError:
                state.entryAdditionResult = .error(action.entryError)
            case is HandleSuccessfulEntryAddition:
                state.entryAdditionResult = .success
            default:
                break
            }
        }

    }

}
