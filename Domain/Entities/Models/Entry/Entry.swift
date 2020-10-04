//
//  Entry.swift
//  Entities
//
//  Created by Yury Buslovsky on 29.09.2020.
//

public struct Entry: Equatable, Hashable {
    public let value: String

    public init(value: String) {
        self.value = value
    }
}
