//
//  URLCoordinatorType.swift
//  CoordinatorType
//
//  Created by Reid Chatham on 5/2/17.
//
//

import UIKit

public protocol URLCoordinatorType: CoordinatorType {
    func start(onViewController viewController: UIViewController, withURL url: URL, animated: Bool)
}
