//
//  RedViewModel.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 6/1/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import Foundation

class RedViewModel: ViewModel {
    var state: State<String> = .loading
    weak var delegate: NetworkingRouter?
}
