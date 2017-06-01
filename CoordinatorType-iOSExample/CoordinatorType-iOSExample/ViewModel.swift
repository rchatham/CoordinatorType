//
//  ViewModel.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 6/1/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import Foundation

protocol ViewModel: class {
    associatedtype Data
    var state: State<Data> { get }
    
    associatedtype Delegate: NetworkRouter
    weak var delegate: Delegate? { get set }
}
