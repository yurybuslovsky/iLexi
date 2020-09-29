//
//  EntryCell.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 22.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import SnapKit
import SwiftUI

// MARK: - Auxiliary

private typealias View = iOSApp.TabBar.EntryList.Root.View
private typealias Cell = View.Cell

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

extension View {

    final class Cell: NiblessTableViewCell, Reusable {

        private lazy var entryValueLabel: UILabel = {
            let entryValueLabel = UILabel()
            entryValueLabel.numberOfLines = 0
            contentView.addSubview(entryValueLabel)
            return entryValueLabel
        }()

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

// MARK: - Public API

extension Cell {

    func setUp(presentationModel: PresentationModel) {
        entryValueLabel.text = presentationModel.entry.value
    }

}

// MARK: - Canvas

#if DEBUG

struct EntryCell_Previews: PreviewProvider {

    static var previews: some SwiftUI.View {
        Group {
            CanvasView(canvasLayout: .fixedWidth()) {
                let cell = Cell(style: .default, reuseIdentifier: "")
                cell.setUp(presentationModel: Cell.PresentationModel(entry: Entry(value: "Disdain")))
                return cell
            }
            .previewLayout(.sizeThatFits)
        }
    }

}

#endif