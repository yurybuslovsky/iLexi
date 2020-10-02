//
//  BaseViewController.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import Observers
import UIKit

// CPD-OFF

open class BaseViewController: NiblessViewController {

    let uiView: UIView
    private let observers: [Observing]

    public init(observers: [Observing], uiView: UIView) {
        self.observers = observers
        self.uiView = uiView
        super.init()
    }

    public override func loadView() {
        view = uiView
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observers.forEach { $0.startObserving() }
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        observers.forEach { $0.stopObserving() }

        if isBeingDismissed {
            viewWasDismissed()
        }
    }

    open func viewWasDismissed() {}

}

// CPD-ON
