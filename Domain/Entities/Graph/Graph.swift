//
//  Graph.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 18.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

final class Graph<Element: Equatable>: ExpressibleByArrayLiteral {

    private var vertices: [Vertex<Element>]

    init(arrayLiteral elements: Element...) {
        self.vertices = elements.map { (element: Element) -> Vertex<Element> in .init(value: element) }
    }

}

// MARK: - Equatable

extension Graph: Equatable {

    static func == (lhs: Graph<Element>, rhs: Graph<Element>) -> Bool {
        lhs.vertices == rhs.vertices
    }

}

// MARK: - Public API

extension Graph {

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
