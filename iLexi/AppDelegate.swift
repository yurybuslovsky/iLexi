//
//  AppDelegate.swift
//  iLexi
//
//  Created by Yury Buslovsky on 31.08.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

@UIApplicationMain
final class AppDelegate: UIResponder {

    // MARK: • Window

    var window: UIWindow?

    // MARK: • DI container

    private let diContainer: RootDIContainer = makeRootDIContainer()

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
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = diContainer.makeRootViewController()
        window?.makeKeyAndVisible()
    }

}
