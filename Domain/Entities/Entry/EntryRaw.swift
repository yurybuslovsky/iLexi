//
//  EntryRaw.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 16.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

extension Entities.Entry {

    struct Raw {
        let value: String
    }

}

// MARK: - Decodable

extension Entities.Entry.Raw: Decodable {}
