//
//  WordListDIContainer.swift
//  iLexi
//
//  Created by Yury Buslovsky on 09.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Init Encapsulation

extension RootDIContainer {

    static func makeWordListDIContainer(rootContainer: RootDIContainer) -> WordListDIContainer {
        .init(rootContainer: rootContainer)
    }

}

// MARK: - Declaration

final class WordListDIContainer {

    // MARK: • Root container

    private unowned let rootContainer: RootDIContainer

    // MARK: • Initialization

    fileprivate init(rootContainer: RootDIContainer) {
        self.rootContainer = rootContainer
    }

}

// MARK: - Navigation Controller

extension WordListDIContainer: WordListNavigationControllerProducing {

    func makeWordListNavigationController() -> WordListNavigationController {
        let wordListVC = makeWordListViewController()
        let wordListNC = WordListNavigationController(wordListVC: wordListVC, favoritesVCFactory: rootContainer)
        return wordListNC
    }

}

// MARK: - Root

extension WordListDIContainer: WordListViewControllerProducing {

    func makeWordListViewController() -> WordListViewController {
        let wordListVC = WordListViewController()
        return wordListVC
    }

}
