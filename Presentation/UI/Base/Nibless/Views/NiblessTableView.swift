//
//  NiblessTableView.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 21.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// CPD-OFF

class NiblessTableView: UITableView {

    init() {
        super.init(frame: .zero, style: .plain)
        tableFooterView = UIView()
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(L10n.Common.niblessViewsDescription)
    }

}

// CPD-ON
