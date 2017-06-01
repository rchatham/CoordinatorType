//
//  YellowViewModel.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 6/1/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import Foundation

class YellowViewModel: ViewModel {
    var state: State<String> = .loading
    weak var delegate: NetworkingRouter?
}
