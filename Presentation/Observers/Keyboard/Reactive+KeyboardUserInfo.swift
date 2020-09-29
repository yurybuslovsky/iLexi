//
//  Reactive+KeyboardUserInfo.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 24.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Foundation
import RxSwift

extension Reactive where Base: NotificationCenter {

    func keyboardUserInfo(
        for notificationName: NSNotification.Name,
        object: AnyObject? = nil
    ) -> Observable<Keyboard.UserInfo> {
        base.rx.notification(notificationName, object: object)
            .compactMap { (notification: Notification) -> Keyboard.UserInfo? in
                Keyboard.UserInfo(notification: notification)
            }
    }

}
