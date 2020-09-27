//
//  UITableView+Registration.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 22.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

extension UITableView {

    final func register<Cell: UITableViewCell>(_: Cell.Type) where Cell: Reusable {
        register(Cell.self, forCellReuseIdentifier: Cell.reuseID)
    }

    final func dequeue<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell? where Cell: Reusable {
        dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell
    }

}
