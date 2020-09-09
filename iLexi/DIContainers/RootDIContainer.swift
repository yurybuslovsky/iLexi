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

    private lazy var wordListFactory: WordListViewControllerProducing = {
        RootDIContainer.makeWordListDIContainer(rootContainer: self)
    }()

    private lazy var userProfileFactory: UserProfileViewControllerProducing = {
        RootDIContainer.makeUserProfileDIContainer(rootContainer: self)
    }()

    // MARK: • Initialization

    fileprivate init() {}

}

// MARK: - Root

extension RootDIContainer {

    func makeRootViewController() -> RootViewController {
        let wordListVC = makeWordListViewController()
        let userProfileVC = makeUserProfileViewController()

        let rootVC = RootViewController(
            wordListVC: wordListVC,
            userProfileVC: userProfileVC
        )

        return rootVC
    }

}

// MARK: - Tabs

extension RootDIContainer {

    private func makeWordListViewController() -> WordListViewController {
        let wordListVC = wordListFactory.makeWordListViewController()
        return wordListVC
    }

    private func makeUserProfileViewController() -> UserProfileViewController {
        let userProfileVC = userProfileFactory.makeUserProfileViewController()
        return userProfileVC
    }

}

// MARK: - Common

extension RootDIContainer: FavoritesViewControllerProducing {

    func makeFavoritesViewController() -> FavoritesViewController {
        let favoritesVC = FavoritesViewController()
        return favoritesVC
    }

}
