//
//  ConverterViewController.swift
//  СonversionIOSApp
//
//  Created by Тимофей on 28.12.2020.
//

import UIKit

class ConverterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var labelCur: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var currencies = [Currency]()
    
    var num = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrenciesNetworkService.getCurrencies{ (response) in
            self.currencies = response.currencies
            self.pickerView.reloadAllComponents()
            self.labelCur.text = self.currencies[0].cc
            self.num = 0
        }
    }
    @IBAction func editingTextField(_ sender: UITextField) {
        let text = convert(str: textField1.text!)
        if text != nil{
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
            if let formattedTipAmount = formatter.string(from: text! * currencies[num].rate as NSNumber) {
                textField2.text = String(formattedTipAmount.dropFirst())
            }
        }else{
            textField2.text = ""
        }
    }
    
    func convert(str: String) -> Double?{
        if let intVersion = Double(str){
            return intVersion
        }
        return nil
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row].cc
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelCur.text = currencies[row].cc
        num = row
        editingTextField(textField1)
    }

}
