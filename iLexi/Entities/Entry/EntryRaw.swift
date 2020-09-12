//
//  Entry.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

struct EntryRaw: Decodable {
    let id: String
    let value: String
    let definitions: [String]
    let translations: [String]
    let synonymsIDs: [String]
}
