//
//  NetworkingRouter.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 6/1/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import Foundation
import Architecture

class NetworkingRouter: NetworkRouter {
    static let shared: NetworkRouter = NetworkingRouter()
}

extension NetworkingRouter: BlueNetworkRouter {}

extension NetworkingRouter: RedNetworkRouter {}

extension NetworkingRouter: YellowNetworkRouter {}
