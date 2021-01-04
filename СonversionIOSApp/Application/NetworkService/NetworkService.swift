//
//  NetworkService.swift
//  СonversionIOSApp
//
//  Created by Тимофей on 28.12.2020.
//

import Foundation

class NetworkService{
    
    private init(){}
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Any) -> ()){
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async(execute: {
                    completion(json)
                })
            }catch{
                print(error)
            }
        }.resume()
    }
    
}
