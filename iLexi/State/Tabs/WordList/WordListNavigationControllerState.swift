//
//  WordListState.swift
//  iLexi
//
//  Created by Yury Buslovsky on 10.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

// MARK: - Declaration

enum WordListNavigationControllerState: Equatable {
    case root(WordListViewControllerState)
    case favorites(FavoritesViewControllerState)
}

// MARK: - Default

extension WordListNavigationControllerState {
    static var `default`: WordListNavigationControllerState { .root(.default) }
}
