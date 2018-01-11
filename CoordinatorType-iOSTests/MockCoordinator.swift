//
//  MockCoordinator.swift
//  CoordinatorType-iOSTests
//
//  Created by Reid Chatham on 1/11/18.
//

import UIKit

class MockCoordinator: CoordinatorType {
    struct Dependencies {

    }

    var delegate: CoordinatorTypeDelegate?
    var childCoordinators: [CoordinatorTypeDelegate] = []
    var dependencies: MockCoordinator.Dependencies?

    required init() {}

    func viewController() -> UIViewController {
        return UIViewController()
    }
}
