//
//  Neigboring.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

protocol Neighboring: Identifiable, Equatable {
    var neighborsIDs: [ID] { get }
}
