//
//  KeyboardUserInfo.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 24.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

extension Keyboard {

    struct UserInfo {
        let animationCurve: UIView.AnimationCurve
        let animationDuration: TimeInterval
        let isLocal: Bool
        let beginFrame: CGRect
        let endFrame: CGRect

        init?(notification: Notification) {
            var animationCurve: UIView.AnimationCurve = .linear
            var animationDuration: TimeInterval = .zero
            var isLocal = false
            var beginFrame: CGRect = .zero
            var endFrame: CGRect = .zero

            let userInfo: [AnyHashable: Any]? = notification.userInfo
                .flatMap { (userInfo: [AnyHashable: Any]) -> Int? in
                    userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int
                }
                .flatMap(UIView.AnimationCurve.init)
                .flatMap {
                    animationCurve = $0
                    return notification.userInfo
                }
                .flatMap { (userInfo: [AnyHashable: Any]) -> TimeInterval? in
                    userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
                }
                .flatMap {
                    animationDuration = $0
                    return notification.userInfo
                }
                .flatMap { (userInfo: [AnyHashable: Any]) -> Bool? in
                    userInfo[UIResponder.keyboardIsLocalUserInfoKey] as? Bool
                }
                .flatMap {
                    isLocal = $0
                    return notification.userInfo
                }
                .flatMap { (userInfo: [AnyHashable: Any]) -> CGRect? in
                    userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect
                }
                .flatMap {
                    beginFrame = $0
                    return notification.userInfo
                }
                .flatMap { (userInfo: [AnyHashable: Any]) -> CGRect? in
                    userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
                }
                .flatMap {
                    endFrame = $0
                    return notification.userInfo
                }

            if userInfo == nil { return nil }

            self.animationCurve = animationCurve
            self.animationDuration = animationDuration
            self.isLocal = isLocal
            self.beginFrame = beginFrame
            self.endFrame = endFrame
        }
    }

}
