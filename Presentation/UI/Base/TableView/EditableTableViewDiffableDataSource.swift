//
//  EditableTableViewDiffableDataSource.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

final class EditableTableViewDiffableDataSource<
    SectionType: Hashable,
    ItemType: Hashable
>: UITableViewDiffableDataSource<SectionType, ItemType> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { true }
}
