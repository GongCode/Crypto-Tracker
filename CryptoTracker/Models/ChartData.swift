//
//  ChartData.swift
//  CryptoTracker
//
//  Created by Jason Gong on 1/4/23.
//

import Foundation

struct ChartData: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let value: Double
}
