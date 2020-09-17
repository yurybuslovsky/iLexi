//
//  EntryFormatted.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

extension Entities.Entry {

    struct Formatted {
        typealias Raw = Entities.Entry.Raw

        let value: String
    }

}

// MARK: - Equatable

extension Entities.Entry.Formatted: Equatable {}

// MARK: - Formatting

extension Entities.Entry.Formatted {

    init(raw: Raw) {
        value = raw.value
    }

}
