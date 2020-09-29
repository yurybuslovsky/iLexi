//
//  EntryListView.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 21.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - Auxiliary

private typealias Root = iOSApp.TabBar.EntryList.Root
private typealias View = Root.View

extension View {
    typealias L10n = iLexi.L10n.EntryList
}

// MARK: - Declaration

extension Root {

    final class View: NiblessTableView, Rendering {

        weak var ixResponder: IXResponder?

        private lazy var diffableDS: EditableTableViewDiffableDataSource<Int, Cell.PresentationModel> = {
            register(Cell.self)

            let diffableDS = EditableTableViewDiffableDataSource<Int, Cell.PresentationModel>(
                tableView: self
            ) { (tableView: UITableView, indexPath: IndexPath, model: Cell.PresentationModel) -> UITableViewCell? in
                let cell: Cell? = tableView.dequeue(for: indexPath)
                cell?.setUp(presentationModel: model)
                return cell
            }

            dataSource = diffableDS
            delegate = self
            return diffableDS
        }()

    }

}

// MARK: - Rendering

extension View: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
    }

    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: L10n.deleteEntry
        ) { [weak self] (_, _, completion: @escaping (Bool) -> Void) in
            self?.ixResponder?.removeEntry(at: indexPath.row)
            completion(true)
        }

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }

}

// MARK: - Rendering

extension View {

    func render(entries: [Entry]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Cell.PresentationModel>()
        snapshot.appendSections([.zero])
        snapshot.appendItems(entries.map(Cell.PresentationModel.init), toSection: .zero)
        diffableDS.apply(snapshot, animatingDifferences: !entries.isEmpty)
    }

}

// MARK: - Canvas

#if DEBUG

struct EntryListView_Previews: PreviewProvider {

    static var previews: some SwiftUI.View {
        Group {
            CanvasView {
                let view = View()

                view.render(entries: [
                    Entry(value: "Disdain"),
                    Entry(value: "Despise"),
                    Entry(value: "Scorn"),
                    Entry(value: "Contemn"),
                ])

                return view
            }
            .previewLayout(.sizeThatFits)
        }
    }

}

#endif
