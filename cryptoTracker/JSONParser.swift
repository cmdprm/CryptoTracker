//
//  JSONParser.swift
//  cryptoTracker
//
//  Created by User on 17.10.2022.
//

import Foundation

protocol RateManagerDelegate {
    func didUpdateRate(data: Rate)
}

struct JSONParser {
    let apiKey = "F6D2C5C7-AEFD-44FE-8DC1-36F02478CD0E"
    var urlString = ""
    
    var delegate: RateManagerDelegate?
    
    mutating func setUpLink(title: String) {
        var crypto = ""
        
        switch title {
        case "BTC":
            crypto = "BTC"
        case "ETH":
            crypto = "ETH"
        case "LTC":
            crypto = "LTC"
        case "TRX":
            crypto = "TRX"
        case "ADA":
            crypto = "ADA"
        case "SOL":
            crypto = "SOL"
        default:
            crypto = "BTC"
        }
        
        self.urlString = "https://rest.coinapi.io/v1/exchangerate/\(crypto)/USD?apikey=\(self.apiKey)"
        performTask()
    }
    
    func performTask() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("Error #1 | \(error!)")
                    return
                }
                
                if let data = data {
                    if let rate = parseJSON(data: data) {
                        self.delegate?.didUpdateRate(data: rate)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(data: Data) -> Rate? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Rate.self, from: data)
            
            return decodedData
        }
        catch {
            print("Error #2 | \(error)")
            return nil
        }
    }
    
}
