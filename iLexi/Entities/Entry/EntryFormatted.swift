//
//  EntryFormatted.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Identifiable

extension EntryFormatted {

    typealias ID = String

}

// MARK: - Declaration

struct EntryFormatted: Neighboring {

    let id: ID
    let value: String
    let isFavorite: Bool
    let definitions: [String]
    let translations: [String]
    let neighborsIDs: [String]

    init(
        id: ID,
        value: String,
        isFavorite: Bool,
        definitions: [String],
        translations: [String],
        neighborsIDs: [String]
    ) {
        self.id = id
        self.value = value
        self.isFavorite = isFavorite
        self.definitions = definitions
        self.translations = translations
        self.neighborsIDs = neighborsIDs
    }

}

// MARK: - Equatable

extension EntryFormatted {

    static func == (lhs: EntryFormatted, rhs: EntryFormatted) -> Bool {
        lhs.id == rhs.id
    }

}

// MARK: - Formatting

extension EntryFormatted {

    init(rawEntry: EntryRaw, favoritesIDs: [ID]) {
        let id = rawEntry.id

        self.init(
            id: id,
            value: rawEntry.value,
            isFavorite: favoritesIDs.contains(id),
            definitions: rawEntry.definitions,
            translations: rawEntry.translations,
            neighborsIDs: rawEntry.synonymsIDs
        )
    }

}
