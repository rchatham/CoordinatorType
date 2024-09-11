//
//  TabCoordinatorType.swift
//  CoordinatorType
//
//  Created by Reid Chatham on 2/26/17.
//
//

import Cocoa


@objc public protocol TabCoordinatorType: CoordinatorType {
    weak var tabController: NSTabViewController? { get set }
    func rootViewControllers() -> [NSViewController]
}

extension TabCoordinatorType {
    public func tabController() -> NSTabViewController {
        return viewController() as! NSTabViewController
    }
    
    public func viewController() -> NSViewController {
        let tab = NSTabViewController()
        start(onTabController: tab)
        return tab
    }
    
    public func start(onViewController viewController: NSViewController, animated: Bool) {
        if let tab = viewController as? NSTabViewController {
            start(onTabController: tab)
        } else {
            let tab = NSTabViewController()
            start(onTabController: tab)
            viewController.presentViewControllerAsSheet(tab)
        }
    }
    
    private func start(onTabController tabController: NSTabViewController) {
        let roots = rootViewControllers()
        tabController.childViewControllers = roots
        self.tabController = tabController
    }
}
