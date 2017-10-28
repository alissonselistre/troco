//
//  Global.swift
//  Troco
//
//  Created by Alisson L. Selistre on 28/10/17.
//  Copyright © 2017 Alisson. All rights reserved.
//

import UIKit

enum Money: Int {

    case centavo1 = 1
    case centavo5 = 5
    case centavo10 = 10
    case centavo25 = 25
    case centavo50 = 50
    case real1 = 100
    case real2 = 200
    case real5 = 500
    case real10 = 1000
    case real20 = 2000
    case real50 = 5000
    case real100 = 10000

    static let cases = [real100, real50, real20, real10, real5, real2, real1, centavo50, centavo25, centavo10, centavo5, centavo1]
}

let maxValue: Int = 999_999

let currencyFormater: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = NumberFormatter.Style.currency
    formatter.locale = Locale(identifier: "pt-br")
    return formatter
}()

var totalValue: Int = 0
var totalPaid: Int = 0
var moneyList: [Money] = []

var partialChange: Int {
    return moneyList.map { $0.rawValue }.reduce(0, +)
}

var totalChange: Int {
    return totalPaid - totalValue
}
