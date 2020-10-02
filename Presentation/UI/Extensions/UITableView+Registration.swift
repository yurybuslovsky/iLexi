//
//  UITableView+Registration.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import UIKit

public extension UITableView {

    final func register<Cell: UITableViewCell>(_: Cell.Type) where Cell: Reusable {
        register(Cell.self, forCellReuseIdentifier: Cell.reuseID)
    }

    final func dequeue<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell? where Cell: Reusable {
        dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell
    }

}
