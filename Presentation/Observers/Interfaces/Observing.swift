//
//  Observing.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 18.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

protocol Observing: ObservingStopping {
    func startObserving()
    func stopObserving()
}
