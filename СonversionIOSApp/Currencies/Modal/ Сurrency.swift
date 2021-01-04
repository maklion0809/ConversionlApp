//
//   Сurrency.swift
//  СonversionIOSApp
//
//  Created by Тимофей on 28.12.2020.
//

import Foundation

struct Currency {
    var r030: Int
    var txt: String
    var rate: Double
    var cc: String
    var exchangedate: String
    
    init?(dict: [String: AnyObject]) {
        guard let r030 = dict["r030"] as? Int, let txt = dict["txt"] as? String, let rate = dict["rate"] as? Double, let cc = dict["cc"] as? String, let exchangedate = dict["exchangedate"] as? String else { return nil }
        self.r030 = r030
        self.txt = txt
        self.rate = rate
        self.cc = cc
        self.exchangedate = exchangedate
    }
}
