//
//  Constraint+Zeroing.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 24.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import SnapKit

extension Constraint {

    @discardableResult
    func zeroOut() -> Constraint { update(offset: 0).update(inset: 0) }

}
