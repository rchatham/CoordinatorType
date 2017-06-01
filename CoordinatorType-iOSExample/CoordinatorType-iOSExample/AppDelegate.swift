//
//  AppDelegate.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 5/31/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import UIKit
import CoordinatorType

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

extension AppDelegate: AppCoordinatorType {
    func viewController() -> UIViewController {
        let navCoord = NavigationCoordinator()
        navCoord.delegate = self
        childCoordinators.append(navCoord)
        return navCoord.navigationController()
    }
}
