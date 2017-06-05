//
//  RedViewModel.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 6/1/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import Foundation
import Architecture

class RedViewModel: ViewModel {
    var state: State<Int>? = .loading(nil)
    weak var delegate: NetworkingRouter?
}
