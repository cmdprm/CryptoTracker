//
//  JSONParser.swift
//  cryptoTracker
//
//  Created by User on 17.10.2022.
//

import Foundation

struct JSONParser {
    let urlString = "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=07C996B7-1F9F-42CE-B9DE-6AEA26F6884E"
    
    let test = 123
    
    func parse() {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(Rate.self, from: data)
                        
                    }
                    catch {
                        print(error)
                    }
                }
            }
        }
        
    }
    
}
