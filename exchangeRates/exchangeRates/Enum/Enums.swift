//
//  Enums.swift
//  exchangeRates
//
//  Created by muhammad huzaifa on 9/19/21.
//

import Foundation

enum URLOfExchange: String {
    case baseURL = "https://api.nomics.com/v1/exchange-rates?key=5e16abe6b20edacdefcd4e82653c6ccac97f46dd"
}

enum ErrorTypes: Error {
    case decodingError
    case networkError
}
