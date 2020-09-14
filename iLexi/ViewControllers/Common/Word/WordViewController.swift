//
//  WordViewController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Factory Protocol

protocol WordViewControllerProducing: class {
    func makeWordViewController() -> WordViewController
}

// MARK: - Declaration

final class WordViewController: NiblessViewController {

    // MARK: • Initialization

    override init() {
        super.init()
    }

}