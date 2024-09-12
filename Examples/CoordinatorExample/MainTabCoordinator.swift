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
    struct Dependencies {}

    required init() {}

    var dependencies: MainTabCoordinator.Dependencies?
    weak var delegate: CoordinatorTypeDelegate?
    var childCoordinators: [CoordinatorTypeDelegate] = []

    weak var tabController: UITabBarController? {
        didSet {
            tabController?.selectedIndex = 1
        }
    }

    func rootViewControllers() -> [UIViewController] {
        return [
            tabConfiguredViewController(
                coordinator: ContactsCoordinator(parent: self),
                tabBarItem: UITabBarItem(
                    title: "Contacts",
                    image: #imageLiteral(resourceName: "people-icon"),
                    selectedImage: nil
                )
            ),
            tabConfiguredViewController(
                coordinator: InboxCoordinator(parent: self),
                tabBarItem: UITabBarItem(
                    title: "Inbox",
                    image: #imageLiteral(resourceName: "logo-empty"),
                    selectedImage: nil
                )
            ),
            tabConfiguredViewController(
                coordinator: SettingsCoordinator(parent: self),
                tabBarItem: UITabBarItem(
                    title: "Settings",
                    image: #imageLiteral(resourceName: "gear-2"),
                    selectedImage: nil
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
