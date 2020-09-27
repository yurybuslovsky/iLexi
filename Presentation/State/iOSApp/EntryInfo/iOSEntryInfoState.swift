//
//  iOSEntryInfoState.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 17.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

private typealias EntryInfo = iOSApp.EntryInfo

extension EntryInfo {

    struct State: Equatable, Defaultable {
        static var `default`: State { .init(entryAdditionResult: .unknown) }

        var entryAdditionResult: VoidResult<Entry.Error>
    }

}

// MARK: - Scoping

extension EntryInfo {

    static func makeEntryInfoScopedState(from state: iOSApp.State) -> ScopedState<State> {
        switch state.topControllerStateStack.last {
        case let .some(.entryInfo(entryInfoState)):
            return .inScope(entryInfoState)
        default:
            return .outOfScope
        }
    }

}
