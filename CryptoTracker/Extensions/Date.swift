//
//  Date.swift
//  CryptoTracker
//
//  Created by Jason Gong on 1/4/23.
//

import Foundation

extension Date {
    
    // "2021-11-10T14:24:11.849Z"
    
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
}
