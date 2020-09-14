//
//  WordOperationState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 13.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

enum WordOperationState: Equatable {
    case new
    case edit(word: EntryFormatted)
}

// MARK: - Default

extension WordOperationState {
    static var `default`: WordOperationState { .new }
}
