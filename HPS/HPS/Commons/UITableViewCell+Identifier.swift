//
//  UITableViewCell+Identifier.swift
//  HPS
//
//  Created by Jared Perez Vega on 24/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static func getIdentifier() -> String {
        return String(describing: self)
    }
}
