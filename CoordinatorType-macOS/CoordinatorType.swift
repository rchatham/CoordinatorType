//
//  CoordinatorType.swift
//  CoordinatorType
//
//  Created by Reid Chatham on 2/26/17.
//
//

import Cocoa

public protocol CoordinatorType: CoordinatorTypeDelegate {
    weak var delegate: CoordinatorTypeDelegate? { get }
    var childCoordinators: [CoordinatorType] { get set }
    func viewController() -> NSViewController
    func start(onViewController viewController: NSViewController, animated: Bool)
}

extension CoordinatorType {
    public func start(onViewController viewController: NSViewController, animated: Bool) {
        viewController.presentViewControllerAsSheet(self.viewController())
    }
}

public protocol CoordinatorTypeDelegate: class {
    func coordinatorDidFinish(_ coordinator: CoordinatorType)
}

extension CoordinatorTypeDelegate where Self: CoordinatorType {
    public func coordinatorDidFinish(_ coordinator: CoordinatorType) {
        guard let idx = childCoordinators.index(where: { $0 === coordinator }) else { return }
        childCoordinators.remove(at: idx)
    }
}


