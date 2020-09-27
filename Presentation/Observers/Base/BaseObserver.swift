//
//  BaseObserver.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 19.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

typealias BaseObserver<EventResponder: AnyObject> = Observing & InterruptibleObserver<EventResponder>
