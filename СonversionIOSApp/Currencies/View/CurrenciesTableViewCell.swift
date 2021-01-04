//
//  CurrenciesTableViewCell.swift
//  СonversionIOSApp
//
//  Created by Тимофей on 28.12.2020.
//

import UIKit

class CurrenciesTableViewCell: UITableViewCell {

    func configure(with currency: Currency){
        self.textLabel?.text = currency.txt
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: currency.rate as NSNumber) {
            self.detailTextLabel?.text = String(formattedTipAmount.dropFirst())
        }
    }
}
