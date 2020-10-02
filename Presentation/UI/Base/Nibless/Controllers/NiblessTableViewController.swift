//
//  NiblessTableViewController.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import UIKit

// CPD-OFF

open class NiblessTableViewController: UITableViewController {

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(
            """
            Loading this view controller from a nib is unsupported in favor of initializer dependency injection
            """
        )
    }

    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

}

// CPD-ON
