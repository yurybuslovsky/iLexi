//
//  Reusable.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 22.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

protocol Reusable {}

extension Reusable where Self: UIResponder {
    static var reuseID: String { .init(describing: self) }
}
