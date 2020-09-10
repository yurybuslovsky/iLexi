//
//  WordListNavigationController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Factory Protocol

protocol WordListNavigationControllerProducing {
    func makeWordListNavigationController() -> WordListNavigationController
}

// MARK: - Declaration

final class WordListNavigationController: NiblessNavigationController {

    // MARK: • Root view controller

    private let wordListVC: WordListViewController

    // MARK: • Pushed view controllers

    private unowned let favoritesVCFactory: FavoritesViewControllerProducing
    private var favoritesVC: FavoritesViewController?

    // MARK: • Initialization

    init(
        wordListVC: WordListViewController,
        favoritesVCFactory: FavoritesViewControllerProducing
    ) {
        self.wordListVC = wordListVC
        self.favoritesVCFactory = favoritesVCFactory

        super.init()

        self.delegate = self

        setUpUI()
    }

}

// MARK: - Private API

extension WordListNavigationController {

    private func setUpUI() {
        tabBarItem = UITabBarItem(title: L10n.TabBarItem.userProfile, image: nil, selectedImage: nil)
        pushViewController(wordListVC, animated: false)
    }

}

// MARK: - UINavigationControllerDelegate

extension WordListNavigationController: UINavigationControllerDelegate {

    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        switch viewController {
        case is WordListViewController:
            #warning("Start use case")
        default:
            return
        }
    }

}
