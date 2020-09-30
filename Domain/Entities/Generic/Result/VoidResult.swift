//
//  VoidResult.swift
//  Domain
//
//  Created by Yury Buslovsky on 29.09.2020.
//

public extension Entities {

    enum VoidResult<ErrorType: Error & Equatable>: Equatable {
        case unknown
        case success
        case error(ErrorType)
    }

}
