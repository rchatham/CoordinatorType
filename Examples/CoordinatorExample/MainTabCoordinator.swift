//
//  MainTabCoordinator.swift
//  HermesTranslator
//
//  Created by Reid Chatham on 1/18/17.
//  Copyright © 2017 Hermes Messenger LLC. All rights reserved.
//

import CoordinatorType
import UIKit

class MainTabCoordinator: TabCoordinatorType {
    weak var delegate: CoordinatorTypeDelegate?
    var childCoordinators: [CoordinatorType] = []

    weak var tabController: UITabBarController? {
        didSet {
            tabController?.selectedIndex = 1
        }
    }

    func rootViewControllers() -> [UIViewController] {
        return [
            tabConfiguredViewController(
                coordinator: ContactsCoordinator(),
                tabBarItem: UITabBarItem(
                    title: "Contacts",
                    image: UIImage(systemName: "person.crop.circle"),
                    selectedImage: UIImage(systemName: "person.crop.circle.fill")
                )
            ),
            tabConfiguredViewController(
                coordinator: InboxCoordinator(),
                tabBarItem: UITabBarItem(
                    title: "Inbox",
                    image: UIImage(systemName: "tray"),
                    selectedImage: UIImage(systemName: "tray.fill")
                )
            ),
            tabConfiguredViewController(
                coordinator: SettingsCoordinator(),
                tabBarItem: UITabBarItem(
                    title: "Settings",
                    image: UIImage(systemName: "gearshape"),
                    selectedImage: UIImage(systemName: "gearshape.fill")
                )
            ),
        ]
    }

    public func tabConfiguredViewController<T: CoordinatorType>(coordinator: T, tabBarItem: UITabBarItem) -> UIViewController {
        let vc = coordinator.viewController()
        vc.tabBarItem = tabBarItem
        return vc
    }
}

class ContactsCoordinator: CoordinatorType {
    var delegate: CoordinatorTypeDelegate?
    var childCoordinators: [CoordinatorType] = []
    func viewController() -> UIViewController {
        return UIViewController()
    }
}

class InboxCoordinator: CoordinatorType {
    var delegate: CoordinatorTypeDelegate?
    var childCoordinators: [CoordinatorType] = []
    func viewController() -> UIViewController {
        return UIViewController()
    }
}

class SettingsCoordinator: CoordinatorType {
    var delegate: CoordinatorTypeDelegate?
    var childCoordinators: [CoordinatorType] = []
    func viewController() -> UIViewController {
        return UIViewController()
    }
}
