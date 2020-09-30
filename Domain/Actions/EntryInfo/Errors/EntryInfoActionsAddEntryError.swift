//
//  Error.swift
//  Actions
//
//  Created by Yury Buslovsky on 29.09.2020.
//

// MARK: - Namespace

private typealias EntryInfo = Actions.EntryInfo
private typealias Error = EntryInfo.Error

private extension Error {
    typealias L10n = EntryInfo.L10n.Error
}

// MARK: - Declaration

public extension EntryInfo {

    enum Error: LocalizedError {
        case alreadyExists

        public var errorDescription: String? {
            switch self {
            case .alreadyExists:
                return L10n.alreadyExists
            }
        }
    }

}
