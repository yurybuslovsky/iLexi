//
//  NiblessTableViewCell.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import UIKit

// CPD-OFF

open class NiblessTableViewCell: UITableViewCell {

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(
            """
            Loading this view from a nib is unsupported in favor of initializer dependency injection
            """
        )
    }

}

// CPD-ON
