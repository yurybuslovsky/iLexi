//
//  UserProfileViewController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Factory Protocol

protocol UserProfileViewControllerProducing {
    func makeUserProfileViewController() -> UserProfileViewController
}

// MARK: - Declaration

final class UserProfileViewController: NiblessViewController {

    // MARK: • View controller factories

    private unowned let logInVCFactory: LogInViewControllerProducing
    private unowned let favoritesVCFactory: FavoritesViewControllerProducing

    // MARK: • Initialization

    init(
        logInVCFactory: LogInViewControllerProducing,
        favoritesVCFactory: FavoritesViewControllerProducing
    ) {
        self.logInVCFactory = logInVCFactory
        self.favoritesVCFactory = favoritesVCFactory

        super.init()

        setUpUI()
    }

}

// MARK: - Private API

extension UserProfileViewController {

    private func setUpUI() {
        tabBarItem = UITabBarItem(title: L10n.TabBarItem.userProfile, image: nil, selectedImage: nil)
    }

}
