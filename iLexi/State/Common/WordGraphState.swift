//
//  WordGraphState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

struct WordGraphState: Equatable {
    var words: Graph<EntryFormatted>
}

// MARK: - Default

extension WordGraphState {
    static var `default`: WordGraphState { .init(words: []) }
}
