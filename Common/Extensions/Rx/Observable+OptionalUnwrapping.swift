//
//  Observable+OptionalUnwrapping.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 20.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import RxSwift

protocol Nilable {
    associatedtype Wrapped

    var optionalValue: Wrapped? { get }
}

extension Optional: Nilable {
    var optionalValue: Wrapped? { self }
}

extension Observable where Element: Nilable {

    func unwrap() -> Observable<Element.Wrapped> {
        flatMap { (element: Element) -> Observable<Element.Wrapped> in
            if let value = element.optionalValue {
                return .just(value)
            }

            return .empty()
        }
    }

}
