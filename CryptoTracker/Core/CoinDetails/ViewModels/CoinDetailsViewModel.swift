//
//  CoinDetailsViewModel.swift
//  CryptoTracker
//
//  Created by Jason Gong on 1/4/23.
//

import Foundation
import SwiftUI

class CoinDetailsViewModel {
    private let coin: Coin
    
    //chart config
    var chartData = [ChartData]()
    var startDate =  Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()
    var coinName: String {
        return coin.name
    }
    
    var chartLineColor: Color {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) -
        (coin.sparklineIn7D?.price.first ?? 0)
        return priceChange > 0 ? .green : .red
    }
    
    var overviewSectionModel: CoinDetailsSectionModel {
        
        // price stats
        let price = coin.currentPrice.toCurrency()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStats = StatsModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        // market cap stats
        let marketCap = coin.marketCap
        let marketCapPercentChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatsModel(title: "Market Capitalization", value: (marketCap?.formattedWithAbv())!, percentageChange: marketCapPercentChange)
        
        // rank stats
        let rank = coin.marketCapRank
        let rankStat = StatsModel(title: "Rank", value: "\(rank)", percentageChange: nil)
        
        //volume stats
        let volume = coin.totalVolume ?? 0
        let volumeStat = StatsModel(title: "Volume", value: volume.formattedWithAbv(), percentageChange: nil)
        
        return CoinDetailsSectionModel(title: "Overview", stats: [priceStats, marketCapStat, rankStat, volumeStat])
    }
    
    var additionalDetailsSectionModel: CoinDetailsSectionModel {
        
        // 24H high
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStat = StatsModel(title: "24H High", value: high, percentageChange: nil)
        
        // 24H Low
        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStat = StatsModel(title: "24H Low", value: low, percentageChange: nil)
        
        // 24H Price Change
        let priceChange24H = coin.priceChange24H.toCurrency()
        let percentChange24H = coin.priceChangePercentage24H
        let priceChangeStat = StatsModel(title: "24H Price Change", value: priceChange24H, percentageChange: percentChange24H)
        
        // 24H market cap change
        let marketCapChange = coin.marketCapChange24H ?? 0
        let marketCapChangePercent = coin.marketCapChangePercentage24H
        let marketStat = StatsModel(title: "24H Market Cap Change", value: "$\(marketCapChange.formattedWithAbv())", percentageChange: marketCapChangePercent)
        
        return CoinDetailsSectionModel(title: "Overview", stats: [highStat, lowStat, priceChangeStat, marketStat])
    }
    
    init(coin: Coin) {
        self.coin = coin
        configureChartData()
    }
    
    func configureChartData() {
        guard let priceData = coin.sparklineIn7D?.price else { return }
        var index = 0
        self.minPrice = priceData.min()!
        self.maxPrice = priceData.max()!
        self.endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        self.yAxisValues = [minPrice, (minPrice + maxPrice) / 2, maxPrice]
        self.xAxisValues = [startDate, endDate]
        for price in priceData.reversed() {
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            
            let chartDataItem = ChartData(date: date, value: price)
            self.chartData.append(chartDataItem)
            index += 1
        }
        
    }
}
