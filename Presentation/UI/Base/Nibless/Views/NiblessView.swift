//
//  NiblessView.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import UIKit

// CPD-OFF

open class NiblessView: UIView {

    public init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
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
