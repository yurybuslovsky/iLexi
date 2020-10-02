//
//  Observing.swift
//  Observers
//
//  Created by Yury Buslovsky on 30.09.2020.
//

public protocol Observing: ObservingStopping {
    func startObserving()
    func stopObserving()
}
