//
//  Graph.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

final class Graph<Element: Neighboring>: ExpressibleByArrayLiteral {

    private var vertices: [Vertex<Element>]

    init(arrayLiteral elements: Element...) {
        let vertices = elements.map(Vertex.init)

        for vertex in vertices {
            let neighboringElements = elements.filter { (element: Element) -> Bool in
                vertex.value.neighborsIDs.contains(element.id)
            }

            vertex.neighbors = vertices
                .filter { (vertex: Vertex<Element>) -> Bool in
                    neighboringElements.contains(vertex.value)
                }
                .map(Unowned.init)
        }

        self.vertices = vertices
    }

    private init(vertices: [Vertex<Element>]) {
        self.vertices = vertices
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

    var elements: [Element] {
        vertices.map(\.value)
    }

    subscript(_ index: Int) -> Element {
        elements[index]
    }

    func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> Graph {
        .init(vertices: try vertices.filter { (vertex: Vertex<Element>) -> Bool in
            try isIncluded(vertex.value)
        })
    }

}
