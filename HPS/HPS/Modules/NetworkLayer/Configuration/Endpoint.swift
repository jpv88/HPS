//
//  Endpoint.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import UIKit
import Alamofire

enum Endpoint {
    case term(artist: String)
}

protocol Requestable {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String]? { get }
}

extension Endpoint {
    var getRequest: Requestable {
        switch self {
        case .term(let artist):
            return TermNetwork(artist: artist)
        }
    }
}
