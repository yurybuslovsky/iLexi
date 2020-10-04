//
//  Vertex.swift
//  Entities
//
//  Created by Yury Buslovsky on 29.09.2020.
//

extension Graph {

    final class Vertex<T: Equatable>: Equatable {
        static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
            lhs.value == rhs.value
        }

        let value: T

        init(value: T) {
            self.value = value
        }
    }

}
