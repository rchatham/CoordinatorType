//
//  NavigationCoordinatorType.swift
//  CoordinatorType
//
//  Created by Reid Chatham on 2/26/17.
//
//

import UIKit

public protocol NavigationCoordinatorType: CoordinatorType {
    var navigationController: UINavigationController? { get set }
    func rootCoordinator() -> CoordinatorType
}

extension NavigationCoordinatorType {
    
    public func navigationController() -> UINavigationController {
        return viewController() as! UINavigationController
    }
    
    public func viewController() -> UIViewController {
        let nav = UINavigationController()
        start(onNavigationController: nav, animated: false)
        return nav
    }
    
    public func start(onViewController viewController: UIViewController, animated: Bool) {
        if let nav = viewController as? UINavigationController {
            start(onNavigationController: nav, animated: animated)
        } else {
            let nav = UINavigationController()
            start(onNavigationController: nav, animated: false)
            viewController.present(nav, animated: animated, completion: nil)
        }
    }
    
    private func start(onNavigationController navigationController: UINavigationController, animated: Bool) {
        let rootCoord = rootCoordinator()
        childCoordinators.append(rootCoord)
        navigationController.pushViewController(rootCoord.viewController(), animated: animated)
        self.navigationController = navigationController
    }
}
