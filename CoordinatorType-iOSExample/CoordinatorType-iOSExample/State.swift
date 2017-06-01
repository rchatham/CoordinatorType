//
//  State.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 6/1/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import Foundation

enum State<Data> {
    case loading
    case loaded(data: Data?)
    case error(Error)
}
