//
//  getCurrenciesResponse.swift
//  СonversionIOSApp
//
//  Created by Тимофей on 28.12.2020.
//

import Foundation

struct GetCurrenciesRespons {
    typealias JSON = [String: AnyObject]
    let currencies: [Currency]
    
    init(json: Any) throws{
        guard let array = json as? [JSON] else {
            throw NetworkError.failInternerError
        }
        var currencies = [Currency]()
        for dictionary in array{
            guard  let currency = Currency(dict: dictionary) else {
                continue
            }
            currencies.append(currency)
        }
        self.currencies = currencies
    }
}
