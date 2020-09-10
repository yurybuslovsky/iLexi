//
//  LogInViewController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Factory Protocol

protocol LogInViewControllerProducing: class {
    func makeLogInViewController() -> LogInViewController
}

// MARK: - Declaration

final class LogInViewController: NiblessViewController {

    // MARK: • Initialization

    override init() {
        super.init()
    }

}
