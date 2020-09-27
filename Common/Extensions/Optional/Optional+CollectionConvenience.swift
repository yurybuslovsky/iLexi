//
//  Optional+CollectionConvenience.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 24.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

protocol InstantiableCollection: Collection {
    init()
}

extension String: InstantiableCollection {}
extension Array: InstantiableCollection {}

extension Optional where Wrapped: InstantiableCollection {

    var isEmptyOrNil: Bool {
        self?.isEmpty ?? true
    }

    var orEmpty: Wrapped {
        self ?? .init()
    }

}
