//
//  NewWordViewController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Factory Protocol

protocol NewWordViewControllerProducing: class {
    func makeNewWordViewController() -> NewWordViewController
}

// MARK: - Declaration

final class NewWordViewController: NiblessViewController {

    // MARK: • Initialization

    override init() {
        super.init()
    }

}
