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

    // MARK: • Initialization

    override init() {
        super.init()

        setUpUI()
    }

}

// MARK: - Private API

extension UserProfileViewController {

    private func setUpUI() {
        title = L10n.NavBarTitle.userProfile
    }

}
