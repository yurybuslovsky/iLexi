//
//  EntryCell.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

// MARK: - Imports

import SnapKit

import Core
import UI
import Entities

// MARK: - Namespace

private typealias View = iOSApp.TabBar.EntryList.Root.View
private typealias Cell = View.Cell

// MARK: - Presentation Model

extension Cell {

    struct PresentationModel: Hashable {
        let entry: Entry
    }

}

// MARK: - Constants

extension Cell {
    private static var xPadding: CGFloat { 20 }
    private static var yPadding: CGFloat { 10 }
}

// MARK: - Declaration

public extension View {

    final class Cell: NiblessTableViewCell, Reusable {

        // MARK: • Subviews

        private lazy var entryValueLabel: UILabel = {
            let entryValueLabel = UILabel()
            entryValueLabel.numberOfLines = 0
            contentView.addSubview(entryValueLabel)
            return entryValueLabel
        }()

        // MARK: • Initialization

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUpConstaints()
        }

    }

}

// MARK: - Private API

extension Cell {

    private func setUpConstaints() {
        entryValueLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.leading.trailing.equalToSuperview().inset(Self.xPadding)
            make.top.bottom.equalToSuperview().inset(Self.yPadding)
        }
    }

}

// MARK: - Internal API

extension Cell {

    func setUp(presentationModel: PresentationModel) {
        entryValueLabel.text = presentationModel.entry.value
    }

}
