//
//  KeyboardObserver.swift
//  Observers
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - Auxiliary

private typealias UserInfo = Keyboard.UserInfo

// MARK: - Declaration

public extension Keyboard {

    final class Observer<ER: EventResponder>: BaseObserver<ER> {

        private let notificationCenter = NotificationCenter.default

        public override init() {}

        public func startObserving() {
            guard canStartObserving else { return }
            subscribeToKeyboardWillShowNotification()
            subscribeToKeyboardDidShowNotification()
            subscribeToKeyboardWillHideNotification()
            subscribeToKeyboardDidHideNotification()
            subscribeToKeyboardWillChangeFrameNotification()
            subscribeToKeyboardDidChangeFrameNotification()
        }

    }

}

// MARK: - Subscriptions

extension Keyboard.Observer {

    private func subscribeToKeyboardWillShowNotification() {
        let keyboardWillShowSubscription = notificationCenter.rx
            .keyboardUserInfo(for: UIResponder.keyboardWillShowNotification)
            .subscribe(
                onNext: { [weak self] (userInfo: UserInfo) in
                    self?.eventResponder?.keyboardWillShow(userInfo)
                }
            )

        keyboardWillShowSubscription.disposed(by: disposeBag)
        add(subscription: keyboardWillShowSubscription)
    }

    private func subscribeToKeyboardDidShowNotification() {
        let keyboardDidShowSubscription = notificationCenter.rx
            .keyboardUserInfo(for: UIResponder.keyboardDidShowNotification)
            .subscribe(
                onNext: { [weak self] (userInfo: UserInfo) in
                    self?.eventResponder?.keyboardDidShow(userInfo)
                }
            )

        keyboardDidShowSubscription.disposed(by: disposeBag)
        add(subscription: keyboardDidShowSubscription)
    }

    private func subscribeToKeyboardWillHideNotification() {
        let keyboardWillHideSubscription = notificationCenter.rx
            .keyboardUserInfo(for: UIResponder.keyboardWillHideNotification)
            .subscribe(
                onNext: { [weak self] (userInfo: UserInfo) in
                    self?.eventResponder?.keyboardWillHide(userInfo)
                }
            )

        add(subscription: keyboardWillHideSubscription)
        keyboardWillHideSubscription.disposed(by: disposeBag)
    }

    private func subscribeToKeyboardDidHideNotification() {
        let keyboardDidHideSubscription = notificationCenter.rx
            .keyboardUserInfo(for: UIResponder.keyboardDidHideNotification)
            .subscribe(
                onNext: { [weak self] (userInfo: UserInfo) in
                    self?.eventResponder?.keyboardDidHide(userInfo)
                }
            )

        keyboardDidHideSubscription.disposed(by: disposeBag)
        add(subscription: keyboardDidHideSubscription)
    }

    private func subscribeToKeyboardWillChangeFrameNotification() {
        let keyboardWillChangeFrameSubscription = notificationCenter.rx
            .keyboardUserInfo(for: UIResponder.keyboardWillChangeFrameNotification)
            .subscribe(
                onNext: { [weak self] (userInfo: UserInfo) in
                    self?.eventResponder?.keyboardWillChangeFrame(userInfo)
                }
            )

        add(subscription: keyboardWillChangeFrameSubscription)
        keyboardWillChangeFrameSubscription.disposed(by: disposeBag)
    }

    private func subscribeToKeyboardDidChangeFrameNotification() {
        let keyboardDidChangeFrameSubscription = notificationCenter.rx
            .keyboardUserInfo(for: UIResponder.keyboardDidChangeFrameNotification)
            .subscribe(
                onNext: { [weak self] (userInfo: UserInfo) in
                    self?.eventResponder?.keyboardDidChangeFrame(userInfo)
                }
            )

        keyboardDidChangeFrameSubscription.disposed(by: disposeBag)
        add(subscription: keyboardDidChangeFrameSubscription)
    }

}
