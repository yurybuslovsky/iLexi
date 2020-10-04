//
//  EntryListView.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

// MARK: - Imports

import UIKit

import Core
import UI
import Entities

// MARK: - Namespace

private typealias Root = iOSApp.TabBar.EntryList.Root
private typealias View = Root.View

extension View {
    private typealias L10n = Core.L10n.EntryList
}

// MARK: - Declaration

public extension Root {

    final class View: NiblessTableView, Rendering {

        // MARK: • Interactions responder

        public weak var ixResponder: IXResponder?

        // MARK: • Private properties

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

        // MARK: • Initialization

        public override init() {
            super.init()
        }

    }

}

// MARK: - UITableViewDelegate

extension View: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
    }

    public func tableView(
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

    public func render(entries: [Entry]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Cell.PresentationModel>()
        snapshot.appendSections([.zero])
        snapshot.appendItems(entries.map(Cell.PresentationModel.init), toSection: .zero)
        diffableDS.apply(snapshot, animatingDifferences: !entries.isEmpty)
    }

}
