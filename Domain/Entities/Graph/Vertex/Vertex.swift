//
//  Vertex.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 18.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
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
