//
//  CoordinatorType.swift
//  CoordinatorType
//
//  Created by Reid Chatham on 2/26/17.
//
//

import UIKit

public protocol CoordinatorType: CoordinatorTypeDelegate {
    associatedtype Dependencies
    var dependencies: Dependencies? { get set }
    init(parent: CoordinatorTypeDelegate, deps: Dependencies)
    func viewController() -> UIViewController
    func start(onViewController viewController: UIViewController, animated: Bool)
}

extension CoordinatorType {
    public init(parent: CoordinatorTypeDelegate, deps dependencies: Dependencies) {
        self.init(parent: parent)
        self.dependencies = dependencies
    }
}

extension CoordinatorType {
    static func generator() -> (Dependencies, CoordinatorTypeDelegate) -> CoordinatorTypeDelegate {
        return { Self(parent: $1, deps: $0) }
    }
}

extension CoordinatorType {
    public func start(onViewController viewController: UIViewController, animated: Bool) {
        viewController.present(self.viewController(), animated: animated, completion: nil)
    }
}

public protocol CoordinatorTypeDelegate: class {
    weak var delegate: CoordinatorTypeDelegate? { get set }
    var childCoordinators: [CoordinatorTypeDelegate] { get set }
    init(parent: CoordinatorTypeDelegate)
    init()
    func coordinatorDidFinish(_ coordinator: CoordinatorTypeDelegate)
}

extension CoordinatorTypeDelegate {
    init(parent: CoordinatorTypeDelegate) {
        self.init()
        self.delegate = parent
        parent.childCoordinators.append(self)
    }
}

extension CoordinatorTypeDelegate where Self: CoordinatorType {
    public func coordinatorDidFinish(_ coordinator: CoordinatorTypeDelegate) {
        guard let idx = childCoordinators.index(where: { $0 === coordinator }) else { return }
        childCoordinators.remove(at: idx)
    }
}
