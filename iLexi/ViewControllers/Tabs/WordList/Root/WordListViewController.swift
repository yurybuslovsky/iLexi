//
//  WordListViewController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Factory Protocol

protocol WordListViewControllerProducing: class {
    func makeWordListViewController() -> WordListViewController
}

// MARK: - Declaration

final class WordListViewController: NiblessViewController {

    // MARK: • Initialization

    override init() {
        super.init()

        setUpUI()
    }

}

// MARK: - Private API

extension WordListViewController {

    private func setUpUI() {
        title = L10n.NavBarTitle.wordList
    }

}
