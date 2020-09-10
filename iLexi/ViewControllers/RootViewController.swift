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

        setUpUI()
    }

}

// MARK: - Private API

extension RootViewController {

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
