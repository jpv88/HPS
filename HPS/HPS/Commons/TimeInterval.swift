//
//  TimeInterval.swift
//  HPS
//
//  Created by Jared Perez Vega on 24/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import Foundation

extension TimeInterval {
    private var milliseconds: Int {
        return Int((truncatingRemainder(dividingBy: 1)) * 1000)
    }
    
    private var seconds: Int {
        return Int(self) % 60
    }
    
    private var minutes: Int {
        return (Int(self) / 60 ) % 60
    }
    
    private var hours: Int {
        return Int(self) / 3600
    }
    
    var stringTime: String {
        if hours != 0 {
            return "\(hours)h \(minutes)m \(seconds)s"
        } else if minutes != 0 {
            return "\(minutes)m \(seconds)s"
        } else if milliseconds != 0 {
            return "\(seconds)s \(milliseconds)ms"
        } else {
            return "\(seconds)s"
        }
    }
}
