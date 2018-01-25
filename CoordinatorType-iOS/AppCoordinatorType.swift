//
//  AppCoordinator.swift
//  Area
//
//  Created by Reid Chatham on 3/24/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import UIKit

public protocol AppCoordinatorType: CoordinatorType {}

/// Wrapper class for providing app dependencies. Subclass this class to define global dependencies for your app.
open class AppDependencies {}

extension AppCoordinatorType where Self: UIApplicationDelegate {

    public typealias Dependencies = AppDependencies
    
    weak public var delegate: CoordinatorTypeDelegate? {
        get { return nil }
        set {}
    }
    
    public var childCoordinators: [CoordinatorTypeDelegate] {
        get {
            return Static.childCoordinators
        }
        set {
            Static.childCoordinators = newValue
        }
    }

    public var dependencies: Dependencies? {
        get {
            return Static.dependencies
        }
        set {
            Static.dependencies = newValue
        }
    }
}

private struct Static {
    static var childCoordinators: [CoordinatorTypeDelegate] = []
    static var dependencies: AppDependencies?
}
