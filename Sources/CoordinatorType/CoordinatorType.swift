//
//  CoordinatorType.swift
//  CoordinatorType
//
//  Created by Reid Chatham on 2/26/17.
//
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif

public protocol CoordinatorType: CoordinatorTypeDelegate {
    var delegate: CoordinatorTypeDelegate? { get }
    var childCoordinators: [CoordinatorType] { get set }
    #if os(iOS)
    func viewController() -> UIViewController
    func start(onViewController viewController: UIViewController, animated: Bool)
    #elseif os(macOS)
    func viewController() -> NSViewController
    func start(onViewController viewController: NSViewController, animated: Bool)
    #endif
}

extension CoordinatorType {
    #if os(iOS)
    public func start(onViewController viewController: UIViewController, animated: Bool) {
        viewController.present(self.viewController(), animated: animated, completion: nil)
    }
    #elseif os(macOS)
    public func start(onViewController viewController: NSViewController, animated: Bool) {
        viewController.presentAsSheet(self.viewController())
    }
    #endif
}

public protocol CoordinatorTypeDelegate: AnyObject {
    func coordinatorDidFinish(_ coordinator: CoordinatorType)
}

extension CoordinatorTypeDelegate where Self: CoordinatorType {
    public func coordinatorDidFinish(_ coordinator: CoordinatorType) {
        guard let idx = childCoordinators.firstIndex(where: { $0 === coordinator }) else { return }
        childCoordinators.remove(at: idx)
    }
}
