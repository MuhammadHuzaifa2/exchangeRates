//
//  ExchangeDataModel.swift
//  exchangeRates
//
//  Created by muhammad huzaifa on 9/19/21.
//

import Foundation


struct ExchangeViewModel {
    static var shared = ExchangeViewModel()
    
    func getExchangeData(url: String, completition: @escaping (DataModel?, ErrorTypes?) -> ()) {
        NetworkService.shared.networkCall(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = try JSONDecoder().decode([ DataModel].self, from: data as! Data)
                    DispatchQueue.main.async {
                        for x in jsonDecoder{
                        completition(x, nil)
                        }
                    }
                } catch {
                    completition(nil, .decodingError)
                }
            case .failure(_):
                completition(nil, .networkError)
            }
        }
    }
}
