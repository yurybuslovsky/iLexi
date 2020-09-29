//
//  BaseViewController.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 22.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// CPD-OFF

class BaseViewController: NiblessViewController {

    let uiView: UIView
    private let observers: [Observing]

    init(observers: [Observing], uiView: UIView) {
        self.observers = observers
        self.uiView = uiView
        super.init()
    }

    override func loadView() {
        view = uiView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observers.forEach { $0.startObserving() }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        observers.forEach { $0.stopObserving() }

        if isBeingDismissed {
            viewWasDismissed()
        }
    }

    func viewWasDismissed() {}

}

// CPD-ON
