//
//  TabCoordinator.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 5/31/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import UIKit
import CoordinatorType

class TabCoordinator: TabCoordinatorType {
    var delegate: CoordinatorTypeDelegate?
    var childCoordinators: [CoordinatorType] = []
    
    weak var tabController: UITabBarController? {
        didSet {
            tabController?.selectedIndex = 1
            tabController?.delegate = {
                let tabBarDelegate = TabBarControllerDelegate()
                self.tabBarDelegate = tabBarDelegate
                return tabBarDelegate
            }()
        }
    }
    
    private var tabBarDelegate: TabBarControllerDelegate?
    
    func rootViewControllers() -> [UIViewController] {
        return [
            {
                let vm = BlueViewModel()
                let blue = BlueViewController(viewModel: vm)
                blue.tabBarItem = UITabBarItem(title: "Blue", image: nil, selectedImage: nil)
                return blue
            }(),
            {
                let vm = RedViewModel()
                let red = RedTableViewController(viewModel: vm)
                red.tabBarItem = UITabBarItem(title: "Red", image: nil, selectedImage: nil)
                return red
            }(),
            {
                let vm = YellowViewModel()
                let yellow = YellowCollectionViewController(viewModel: vm)
                yellow.tabBarItem = UITabBarItem(title: "Yellow", image: nil, selectedImage: nil)
                return yellow
            }()
        ]
    }
}

class TabBarControllerDelegate: NSObject, UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
