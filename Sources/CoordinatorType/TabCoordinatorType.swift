//
//  TabCoordinator.swift
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

@objc public protocol TabCoordinatorType: CoordinatorType {
#if os(iOS)
    var tabController: UITabBarController? { get set }
    func rootViewControllers() -> [UIViewController]
#elseif os(macOS)
    weak var tabController: NSTabViewController? { get set }
    func rootViewControllers() -> [NSViewController]
#endif
}

extension TabCoordinatorType {
#if os(iOS)
    public func tabController() -> UITabBarController {
        return viewController() as! UITabBarController
    }
#elseif os(macOS)
    public func tabController() -> NSTabViewController {
        return viewController() as! NSTabViewController
    }
#endif

#if os(iOS)
    public func viewController() -> UIViewController {
        let tab = UITabBarController()
        start(onTabController: tab, animated: false)
        return tab
    }
#elseif os(macOS)
    public func viewController() -> NSViewController {
        let tab = NSTabViewController()
        start(onTabController: tab)
        return tab
    }
#endif


#if os(iOS)
    public func start(onViewController viewController: UIViewController, animated: Bool) {
        if let tab = viewController as? UITabBarController {
            start(onTabController: tab, animated: animated)
        } else {
            let tab = UITabBarController()
            start(onTabController: tab, animated: false)
            viewController.present(tab, animated: true, completion: nil)
        }
    }
#elseif os(macOS)
    public func start(onViewController viewController: NSViewController, animated: Bool) {
        if let tab = viewController as? NSTabViewController {
            start(onTabController: tab)
        } else {
            let tab = NSTabViewController()
            start(onTabController: tab)
            viewController.presentAsSheet(tab)
        }
    }
#endif

#if os(iOS)
    private func start(onTabController tabController: UITabBarController, animated: Bool) {
        let roots = rootViewControllers()
        tabController.setViewControllers(roots, animated: animated)
        self.tabController = tabController
    }
#elseif os(macOS)
    private func start(onTabController tabController: NSTabViewController) {
        let roots = rootViewControllers()
        tabController.children = roots
        self.tabController = tabController
    }
#endif
}
