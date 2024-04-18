//
//  StatsModel.swift
//  CryptoTracker
//
//  Created by Jason Gong on 1/4/23.
//

import Foundation

struct StatsModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
}
