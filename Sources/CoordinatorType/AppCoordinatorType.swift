//
//  AppCoordinator.swift
//  Area
//
//  Created by Reid Chatham on 3/24/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

#if os(iOS)
import UIKit

public protocol AppCoordinatorType: CoordinatorType {}

extension AppCoordinatorType where Self: UIApplicationDelegate {
    weak public var delegate: CoordinatorTypeDelegate? {
        get { return nil }
        set {}
    }
    
    public var childCoordinators: [CoordinatorType] {
        get { return Static.childCoordinators }
        set { Static.childCoordinators = newValue }
    }
}

@available(iOS 13.0, *)
extension AppCoordinatorType where Self: UIWindowSceneDelegate {
    weak public var delegate: CoordinatorTypeDelegate? {
        get { return nil }
        set {}
    }

    public var childCoordinators: [CoordinatorType] {
        get { return Static.childCoordinators }
        set { Static.childCoordinators = newValue }
    }
}

private struct Static {
    static var childCoordinators: [CoordinatorType] = []
}
#endif
