//
//  WordListViewController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Factory Protocol

protocol WordListViewControllerProducing {
    func makeWordListViewController() -> WordListViewController
}

// MARK: - Declaration

final class WordListViewController: NiblessViewController {

    // MARK: • View controller factories

    private unowned let newWordVCFactory: NewWordViewControllerProducing
    private unowned let favoritesVCFactory: FavoritesViewControllerProducing

    // MARK: • Initialization

    init(
        newWordVCFactory: NewWordViewControllerProducing,
        favoritesVCFactory: FavoritesViewControllerProducing
    ) {
        self.newWordVCFactory = newWordVCFactory
        self.favoritesVCFactory = favoritesVCFactory

        super.init()

        setUpUI()
    }

}

// MARK: - Private API

extension WordListViewController {

    private func setUpUI() {
        tabBarItem = UITabBarItem(title: L10n.TabBarItem.userProfile, image: nil, selectedImage: nil)
    }

}
