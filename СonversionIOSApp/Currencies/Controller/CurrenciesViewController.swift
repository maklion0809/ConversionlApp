//
//  CurrenciesViewController.swift
//  СonversionIOSApp
//
//  Created by Тимофей on 28.12.2020.
//

import UIKit

class CurrenciesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currencies = [Currency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrenciesNetworkService.getCurrencies{ (response) in
            self.currencies = response.currencies
            self.tableView.reloadData()
        }
    }
}
extension CurrenciesViewController: UITableViewDelegate{
    
}
extension CurrenciesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CurrenciesTableViewCell
        let currency = currencies[indexPath.row]
        cell.configure(with: currency)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
