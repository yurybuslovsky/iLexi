//
//  NiblessTableViewCell.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 22.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// CPD-OFF

class NiblessTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(L10n.Common.niblessViewsDescription)
    }

}

// CPD-ON
