//
//  Vertex.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

final class Vertex<T: Identifiable> {
    let value: T
    var neighbors: [Unowned<Vertex<T>>] = []

    init(value: T) {
        self.value = value
    }
}

// MARK: - Equatable

extension Vertex: Equatable {

    static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        lhs.value.id == rhs.value.id
    }

}
