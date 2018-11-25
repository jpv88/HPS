//
//  TimeInterval.swift
//  HPS
//
//  Created by Jared Perez Vega on 24/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func getString() -> String {
        let minutes = Int(self) / 60000
        let seconds = Int(self) % 60
        return "\(minutes)m \(seconds)s"
    }
}
