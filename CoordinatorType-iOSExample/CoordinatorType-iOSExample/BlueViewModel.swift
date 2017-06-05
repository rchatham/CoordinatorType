//
//  BlueViewModel.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 6/1/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import Foundation
import Architecture

class BlueViewModel: ViewModel {
    var state: State<Void>? = nil
    weak var delegate: NetworkingRouter?
}
