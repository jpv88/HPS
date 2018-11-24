//
//  Constants.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import Foundation
import Alamofire

class Constant {
    struct Base {
        static let url = "https://itunes.apple.com/search"
        static let headers: HTTPHeaders = [
            "Content-Type": "application/json"            
        ]
    }
}
