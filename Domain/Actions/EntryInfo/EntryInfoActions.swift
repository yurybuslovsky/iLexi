//
//  EntryInfoActions.swift
//  Actions
//
//  Created by Yury Buslovsky on 29.09.2020.
//

import ReSwift

// MARK: - Namespace

extension Actions.EntryInfo {
    typealias L10n = Actions.L10n.EntryInfo
}

// MARK: - Declaration

public extension Actions {

    enum EntryInfo {

        public struct HandleSuccessfulEntryAddition: Action {
            public init() {}
        }

        public struct HandleEntryAdditionError: Action {
            public let error: Error

            public init(error: Error) {
                self.error = error
            }
        }

        public struct Dismiss: Action {
            public init() {}
        }

    }

}
