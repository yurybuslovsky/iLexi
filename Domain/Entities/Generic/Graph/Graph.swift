//
//  Graph.swift
//  Entities
//
//  Created by Yury Buslovsky on 29.09.2020.
//

import Core

// MARK: - Declaration

public extension Entities {

    final class Graph<Element: Equatable>: ExpressibleByArrayLiteral {

        private var vertices: [Vertex<Element>]

        public init(arrayLiteral elements: Element...) {
            self.vertices = elements.map { (element: Element) -> Vertex<Element> in .init(value: element) }
        }

    }

}

// MARK: - Equatable

extension Entities.Graph: Equatable {

    public static func == (lhs: Entities.Graph<Element>, rhs: Entities.Graph<Element>) -> Bool {
        lhs.vertices == rhs.vertices
    }

}

// MARK: - Public API

public extension Entities.Graph {

    var isEmpty: Bool {
        vertices.isEmpty
    }

    func append(_ element: Element) {
        vertices.append(Vertex(value: element))
    }

    func remove(at index: Int) {
        vertices.remove(at: index)
    }

    func contains(_ element: Element) -> Bool {
        contains { (nextElement: Element) -> Bool in nextElement == element }
    }

    func contains(where predicate: FactoryBlock<Element, Bool>) -> Bool {
        for vertex in vertices where predicate(vertex.value) {
            return true
        }

        return false
    }

    func toArray() -> [Element] {
        vertices.map(\.value)
    }

}
