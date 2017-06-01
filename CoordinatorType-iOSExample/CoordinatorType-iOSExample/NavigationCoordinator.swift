//
//  NavigationCoordinator.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 5/31/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import UIKit
import CoordinatorType

class NavigationCoordinator: NavigationCoordinatorType {
    weak var delegate: CoordinatorTypeDelegate?
    var childCoordinators: [CoordinatorType] = []
    
    weak var navigationController: UINavigationController?

    func rootViewController() -> UIViewController {
        let tabCoord = TabCoordinator()
        tabCoord.delegate = self
        childCoordinators.append(tabCoord)
        return tabCoord.tabController()
    }
}
