//
//  UseCasesNamespace.swift
//  UseCases
//
//  Created by Yury Buslovsky on 29.09.2020.
//

import Entities
import Actions

typealias Entry = Entities.Entry
typealias Entries = Entities.Graph<Entry>

// swiftlint:disable type_name
typealias _Actions = Actions
// swiftlint:enable type_name

public enum UseCases {}
