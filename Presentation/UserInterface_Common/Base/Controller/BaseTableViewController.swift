//
//  BaseTableViewController.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 21.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// CPD-OFF

class BaseTableViewController: NiblessTableViewController {

    private let uiTableView: UITableView
    private let observers: [Observing]

    init(observers: [Observing], uiTableView: UITableView) {
        self.observers = observers
        self.uiTableView = uiTableView
        super.init()
    }

    override func loadView() {
        view = uiTableView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observers.forEach { $0.startObserving() }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        observers.forEach { $0.stopObserving() }
    }

}

// CPD-ON
