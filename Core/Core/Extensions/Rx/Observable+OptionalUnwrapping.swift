//
//  Observable+OptionalUnwrapping.swift
//  Core
//
//  Created by Yury Buslovsky on 29.09.2020.
//

import RxSwift

public protocol Nilable {
    associatedtype Wrapped

    var optionalValue: Wrapped? { get }
}

extension Optional: Nilable {
    public var optionalValue: Wrapped? { self }
}

public extension Observable where Element: Nilable {

    func unwrap() -> Observable<Element.Wrapped> {
        flatMap { (element: Element) -> Observable<Element.Wrapped> in
            if let value = element.optionalValue {
                return .just(value)
            }

            return .empty()
        }
    }

}
