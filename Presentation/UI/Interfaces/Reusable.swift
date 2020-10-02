//
//  Reusable.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import UIKit

public protocol Reusable {}

public extension Reusable where Self: UIResponder {
    static var reuseID: String { .init(describing: self) }
}
