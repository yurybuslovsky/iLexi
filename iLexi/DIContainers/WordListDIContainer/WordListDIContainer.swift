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

// MARK: - Word List

extension WordListDIContainer: WordListViewControllerProducing {

    func makeWordListViewController() -> WordListViewController {
        let wordListVC = WordListViewController(newWordVCFactory: self, favoritesVCFactory: rootContainer)
        return wordListVC
    }

}

// MARK: - New Word

extension WordListDIContainer: NewWordViewControllerProducing {

    func makeNewWordViewController() -> NewWordViewController {
        let newWordVC = NewWordViewController()
        return newWordVC
    }

}
