//
//  UserProfileNavigationController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Factory Protocol

protocol UserProfileNavigationControllerProducing {
    func makeUserProfileNavigationController() -> UserProfileNavigationController
}

// MARK: - Declaration

final class UserProfileNavigationController: NiblessNavigationController {

    // MARK: • Root view controllers

    private let userProfileVC: UserProfileViewController

    // MARK: • Pushed view controllers

    private unowned let logInVCFactory: LogInViewControllerProducing
    private var logInVC: LogInViewController?

    private unowned let favoritesVCFactory: FavoritesViewControllerProducing
    private var favoritesVC: FavoritesViewController?

    // MARK: • Initialization

    init(
        userProfileVC: UserProfileViewController,
        logInVCFactory: LogInViewControllerProducing,
        favoritesVCFactory: FavoritesViewControllerProducing
    ) {
        self.userProfileVC = userProfileVC
        self.logInVCFactory = logInVCFactory
        self.favoritesVCFactory = favoritesVCFactory

        super.init()

        self.delegate = self

        setUpUI()
    }

}

// MARK: - Private API

extension UserProfileNavigationController {

    private func setUpUI() {
        tabBarItem = UITabBarItem(title: L10n.TabBarItem.userProfile, image: nil, selectedImage: nil)
        pushViewController(userProfileVC, animated: false)
    }

}

// MARK: - UINavigationControllerDelegate

extension UserProfileNavigationController: UINavigationControllerDelegate {
    
    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        switch viewController {
        case is UserProfileViewController:
            #warning("Start use case")
        default:
            return
        }
    }

}
