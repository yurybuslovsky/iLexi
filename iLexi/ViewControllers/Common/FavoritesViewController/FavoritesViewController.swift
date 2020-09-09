//
//  FavoritesViewController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Factory Protocol

protocol FavoritesViewControllerProducing: class {
    func makeFavoritesViewController() -> FavoritesViewController
}

// MARK: - Declaration

final class FavoritesViewController: NiblessViewController {

    // MARK: • Initialization

    override init() {
        super.init()
    }

}
