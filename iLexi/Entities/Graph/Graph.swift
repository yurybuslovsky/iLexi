//
//  Graph.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

final class Graph<Element: Neighboring>: ExpressibleByArrayLiteral {

    private let vertices: [Vertex<Element>]

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

}
