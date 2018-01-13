//
//  CoordinatorType.swift
//  CoordinatorType
//
//  Created by Reid Chatham on 2/26/17.
//

import UIKit

public protocol CoordinatorType: CoordinatorTypeDelegate, CoordinatorTypeDataSource {
    associatedtype Dependencies
    var dependencies: Dependencies? { get set }
    weak var delegate: CoordinatorTypeDelegate? { get set }
    var childCoordinators: [CoordinatorTypeDelegate] { get set }
    init<Coordinator: CoordinatorType>(parent: Coordinator, deps: Dependencies)
    init<Coordinator: CoordinatorType>(parent: Coordinator)
    init()
    static func generator<Parent: CoordinatorType, Child: CoordinatorType>() -> (Child.Dependencies, Parent) -> Child
}

extension CoordinatorType {
    public init<Coordinator: CoordinatorType>(parent: Coordinator, deps dependencies: Dependencies) {
        self.init(parent: parent)
        self.dependencies = dependencies
    }

    public init<Coordinator: CoordinatorType>(parent: Coordinator) {
        self.init()
        self.delegate = parent
        parent.childCoordinators.append(self)
    }

    public static func generator<Parent: CoordinatorType, Child: CoordinatorType>() -> (Child.Dependencies, Parent) -> Child {
        return { Child(parent: $1, deps: $0) }
    }
}

public protocol CoordinatorTypeDataSource: class {
    func viewController() -> UIViewController
}

public protocol CoordinatorTypeDelegate: class {
    func start(onViewController viewController: UIViewController, animated: Bool)
    func coordinatorDidFinish(_ coordinator: CoordinatorTypeDelegate)
}

extension CoordinatorTypeDelegate where Self: CoordinatorTypeDataSource {
    public func start(onViewController viewController: UIViewController, animated: Bool) {
        viewController.present(self.viewController(), animated: animated, completion: nil)
    }
}

extension CoordinatorTypeDelegate where Self: CoordinatorType {
    public func coordinatorDidFinish(_ coordinator: CoordinatorTypeDelegate) {
        guard let idx = childCoordinators.index(where: { $0 === coordinator }) else { return }
        childCoordinators.remove(at: idx)
    }
}
