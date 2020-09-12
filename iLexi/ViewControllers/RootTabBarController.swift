//
//  RootTabBarController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

final class RootTabBarController: NiblessTabBarController {

    // MARK: • Tabs

    private let wordListNC: WordListNavigationController
    private let userProfileNC: UserProfileNavigationController

    // MARK: • Initialization

    init(
        wordListNC: WordListNavigationController,
        userProfileNC: UserProfileNavigationController
    ) {
        self.wordListNC = wordListNC
        self.userProfileNC = userProfileNC

        super.init()

        self.delegate = self

        setUpUI()
    }

}

// MARK: - Private API

extension RootTabBarController {

    private func setUpUI() {
        setViewControllers(
            [
                wordListNC,
                userProfileNC,
            ],
            animated: false
        )
    }

}

// MARK: - UITabBarControllerDelegate

extension RootTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch viewController {
        case is WordListNavigationController:
            #warning("Make use case")
        case is UserProfileNavigationController:
            #warning("Make use case")
        default:
            return
        }
    }

}
