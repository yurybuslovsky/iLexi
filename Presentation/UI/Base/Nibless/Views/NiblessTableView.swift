//
//  NiblessTableView.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import UIKit

// CPD-OFF

open class NiblessTableView: UITableView {

    public init() {
        super.init(frame: .zero, style: .plain)
        tableFooterView = UIView()
    }

    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
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
