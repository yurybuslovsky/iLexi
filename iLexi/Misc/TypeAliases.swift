//
//  TypeAliases.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

typealias DefaultBlock = () -> Void
typealias Block<Input> = (Input) -> Void

typealias DefaultFactoryBlock<Output> = () -> Output
typealias FactoryBlock<Input, Output> = (Input) -> Output
