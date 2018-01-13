//
//  MockNavigationCoordinator.swift
//  CoordinatorType
//
//  Created by Reid Chatham on 5/31/17.
//

import UIKit

class MockNavigationCoordinator: NavigationCoordinatorType {
    struct Dependencies {}

    var delegate: CoordinatorTypeDelegate?
    var childCoordinators: [CoordinatorTypeDelegate] = []
    var navigationController: UINavigationController?
    var dependencies: MockNavigationCoordinator.Dependencies?

    required init() {}

    func rootViewController() -> UIViewController {
        return UIViewController()
    }
}
