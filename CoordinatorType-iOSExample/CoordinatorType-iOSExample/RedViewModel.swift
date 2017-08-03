//
//  RedViewModel.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 6/1/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import Foundation
import Architecture

enum RedError: Error {
}

class RedViewModel: ViewModel {
    var state: State<Int, RedError>? = .loading(nil)
    weak var delegate: NetworkingRouter?
}
