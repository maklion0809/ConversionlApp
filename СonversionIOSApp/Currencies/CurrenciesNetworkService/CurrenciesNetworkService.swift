//
//  CurrenciesNetworkService.swift
//  СonversionIOSApp
//
//  Created by Тимофей on 28.12.2020.
//

import Foundation

class CurrenciesNetworkService{
    private init() {}
    static func getCurrencies(competion: @escaping(GetCurrenciesRespons)->()){
        guard  let url = URL(string: "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json") else {
        return}
        NetworkService.shared.getData(url: url, completion: { (json) in
            do{
                let response = try GetCurrenciesRespons(json: json)
                competion(response)
            }catch{
                print(error)
            }
        })
    }
}
