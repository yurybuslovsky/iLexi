//
//  BaseObserver.swift
//  Observers
//
//  Created by Yury Buslovsky on 02.10.2020.
//

public typealias BaseObserver<EventResponder: AnyObject> = Observing & InterruptibleObserver<EventResponder>
