//
//  IntExtensions.swift
//  Troco
//
//  Created by Alisson L. Selistre on 02/11/17.
//  Copyright © 2017 Alisson. All rights reserved.
//

import UIKit

extension Int {
    internal func asMoney() -> String? {
        let value = Double(self / 100) + Double(self % 100) / 100
        return currencyFormater.string(from: NSNumber(value: value))
    }
}
