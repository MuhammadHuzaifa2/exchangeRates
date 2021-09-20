//
//  ViewController.swift
//  exchangeRates
//
//  Created by muhammad huzaifa on 9/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    var exchangeDictionary: [String: String] = [:]
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var changePrice: UILabel!
    
    
    @IBAction func goSearch(_ sender: Any) {
        changePrice.text = exchangeDictionary[searchBar.text!]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExchangeViewModel.shared.getExchangeData(url: URLOfExchange.baseURL.rawValue, completition: { Exchange, error in
            DispatchQueue.main.async {
                self.exchangeDictionary.updateValue(Exchange!.rate, forKey: Exchange!.currency)
            }
            
        })
        
    }
    
}
