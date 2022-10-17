//
//  RateExchange.swift
//  cryptoTracker
//
//  Created by User on 17.10.2022.
//

import Foundation

struct Rate: Decodable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Float
}
