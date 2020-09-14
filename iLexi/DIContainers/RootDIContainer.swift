//
//  RootDIContainer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Init Encapsulation

extension AppDelegate {

    static func makeRootDIContainer() -> RootDIContainer { .init() }

}

// MARK: - Declaration

final class RootDIContainer {

    // MARK: • Subcontainers

    private lazy var wordListFactory: WordListNavigationControllerProducing = {
        RootDIContainer.makeWordListDIContainer(rootContainer: self)
    }()

    private lazy var userProfileFactory: UserProfileNavigationControllerProducing = {
        RootDIContainer.makeUserProfileDIContainer(rootContainer: self)
    }()

    // MARK: • Initialization

    fileprivate init() {}

}

// MARK: - Root

extension RootDIContainer {

    func makeRootTabBarController() -> RootTabBarController {
        let wordListNC = makeWordListNavigationController()
        let userProfileNC = makeUserProfileNavigationController()

        let rootVC = RootTabBarController(
            wordListNC: wordListNC,
            userProfileNC: userProfileNC
        )

        return rootVC
    }

}

// MARK: - Tabs

extension RootDIContainer {

    private func makeWordListNavigationController() -> WordListNavigationController {
        let wordListNC = wordListFactory.makeWordListNavigationController()
        return wordListNC
    }

    private func makeUserProfileNavigationController() -> UserProfileNavigationController {
        let userProfileNC = userProfileFactory.makeUserProfileNavigationController()
        return userProfileNC
    }

}

// MARK: - Word

extension RootDIContainer: WordViewControllerProducing {

    func makeWordViewController() -> WordViewController {
        let wordVC = WordViewController()
        return wordVC
    }

}

// MARK: - Favorites

extension RootDIContainer: FavoritesViewControllerProducing {

    func makeFavoritesViewController() -> FavoritesViewController {
        let favoritesVC = FavoritesViewController()
        return favoritesVC
    }

}
