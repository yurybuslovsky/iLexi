//
//  RootViewController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

final class RootViewController: NiblessTabBarController {

    // MARK: • Tabs

    private let wordListVC: WordListViewController
    private let userProfileVC: UserProfileViewController

    // MARK: • Initialization

    init(
        wordListVC: WordListViewController,
        userProfileVC: UserProfileViewController
    ) {
        self.wordListVC = wordListVC
        self.userProfileVC = userProfileVC

        super.init()

        setUpTabs()
    }

}

// MARK: - Private API

extension RootViewController {

    private func setUpTabs() {
        setViewControllers(
            [
                wordListVC,
                userProfileVC,
            ],
            animated: false
        )
    }

}
