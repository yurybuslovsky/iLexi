//
//  AppDelegate.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 31.08.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

@UIApplicationMain
final class AppDelegate: UIResponder {

    var window: UIWindow?
//    private let diContainer: AppDIContainer = makeAppDIContainer()

}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setUpWindow()

        return true
    }

}

// MARK: - Private API

extension AppDelegate {

    private func setUpWindow() {
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = diContainer.makeRootTabBarController()
//        window?.makeKeyAndVisible()
    }

}
