//
//  VoidResult.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 27.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

enum VoidResult<ErrorType: Error & Equatable>: Equatable {
    case unknown
    case success
    case error(ErrorType)
}
