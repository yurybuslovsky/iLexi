//
//  EntryInfoState.swift
//  State_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import State
import Actions
import Entities

// MARK: - Namespace

private typealias EntryInfo = iOSApp.EntryInfo

// MARK: - Declaration

public extension EntryInfo {

    struct State: Equatable, Defaultable {
        public static var `default`: State { .init(entryAdditionResult: .unknown) }

        public var entryAdditionResult: Entities.VoidResult<Actions.EntryInfo.Error>
    }

}

// MARK: - Scoping

public extension EntryInfo {

    static func makeEntryInfoScopedState(from state: iOSApp.State) -> ScopedState<State> {
        switch state.topControllerStateStack.last {
        case let .some(.entryInfo(entryInfoState)):
            return .inScope(entryInfoState)
        default:
            return .outOfScope
        }
    }

}
