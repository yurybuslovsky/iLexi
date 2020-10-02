//
//  Reactive+KeyboardUserInfo.swift
//  Observers
//
//  Created by Yury Buslovsky on 02.10.2020.
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
