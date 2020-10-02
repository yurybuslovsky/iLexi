//
//  Constraint+Zeroing.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import SnapKit

public extension Constraint {

    @discardableResult
    func zeroOut() -> Constraint { update(offset: 0).update(inset: 0) }

}
