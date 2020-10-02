//
//  EditableTableViewDiffableDataSource.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import UIKit

public final class EditableTableViewDiffableDataSource<
    SectionType: Hashable,
    ItemType: Hashable
>: UITableViewDiffableDataSource<SectionType, ItemType> {
    public override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { true }
}
