//
//  TypeAliases.swift
//  Core
//
//  Created by Yury Buslovsky on 29.09.2020.
//

public typealias DefaultBlock = () -> Void
public typealias Block<Input> = (Input) -> Void

public typealias DefaultFactoryBlock<Output> = () -> Output
public typealias FactoryBlock<Input, Output> = (Input) -> Output
