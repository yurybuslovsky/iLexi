//
//  NiblessView.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// CPD-OFF

class NiblessView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(L10n.Common.niblessViewsDescription)
    }

}

// CPD-ON
