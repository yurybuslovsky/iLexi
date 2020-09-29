//
//  Optional+CollectionConvenience.swift
//  Core
//
//  Created by Yury Buslovsky on 29.09.2020.
//

public protocol InstantiableCollection: Collection {
    init()
}

extension String: InstantiableCollection {}
extension Array: InstantiableCollection {}

public extension Optional where Wrapped: InstantiableCollection {

    var isEmptyOrNil: Bool {
        self?.isEmpty ?? true
    }

    var orEmpty: Wrapped {
        self ?? .init()
    }

}
