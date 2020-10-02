//
//  BaseTableViewController.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import Observers
import UIKit

// CPD-OFF

open class BaseTableViewController: NiblessTableViewController {

    private let uiTableView: UITableView
    private let observers: [Observing]

    public init(observers: [Observing], uiTableView: UITableView) {
        self.observers = observers
        self.uiTableView = uiTableView
        super.init()
    }

    public override func loadView() {
        view = uiTableView
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observers.forEach { $0.startObserving() }
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        observers.forEach { $0.stopObserving() }
    }

}

// CPD-ON
