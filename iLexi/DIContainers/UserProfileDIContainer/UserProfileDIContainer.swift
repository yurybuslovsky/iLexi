//
//  UserProfileDIContainer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Init Encapsulation

extension RootDIContainer {

    static func makeUserProfileDIContainer(rootContainer: RootDIContainer) -> UserProfileDIContainer {
        .init(rootContainer: rootContainer)
    }

}

// MARK: - Declaration

final class UserProfileDIContainer {

    // MARK: • Root container

    private unowned let rootContainer: RootDIContainer

    // MARK: • Initialization

    fileprivate init(rootContainer: RootDIContainer) {
        self.rootContainer = rootContainer
    }

}

// MARK: - Navigation Controller

extension UserProfileDIContainer: UserProfileNavigationControllerProducing {

    func makeUserProfileNavigationController() -> UserProfileNavigationController {
        let userProfileVC = makeUserProfileViewController()

        let userProfileNC = UserProfileNavigationController(
            userProfileVC: userProfileVC,
            logInVCFactory: self,
            favoritesVCFactory: rootContainer
        )

        return userProfileNC
    }

}

// MARK: - Root

extension UserProfileDIContainer: UserProfileViewControllerProducing {

    func makeUserProfileViewController() -> UserProfileViewController {
        let userProfileVC = UserProfileViewController()
        return userProfileVC
    }

}

// MARK: - Log In

extension UserProfileDIContainer: LogInViewControllerProducing {

    func makeLogInViewController() -> LogInViewController {
        let logInVC = LogInViewController()
        return logInVC
    }

}