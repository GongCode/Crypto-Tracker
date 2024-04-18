//
//  CoinDetailsView.swift
//  CryptoTracker
//
//  Created by Jason Gong on 1/4/23.
//

import SwiftUI

struct CoinDetailsView: View {
    let viewModel: CoinDetailsViewModel
    
    init(coin: Coin) {
        self.viewModel = CoinDetailsViewModel(coin: coin)
    }
    var body: some View {
//        NavigationView {
            ScrollView {
                // charts
                ChartView(viewModel: viewModel)
                    .frame(height: 250)
                    .padding(.vertical)
                
                
                // overview
                CoinDetailsSection(model: viewModel.overviewSectionModel)
                    .padding(.vertical)

                
                //additional details
                CoinDetailsSection(model: viewModel.additionalDetailsSectionModel)
                    .padding(.vertical)
            }
            .padding()
            .navigationTitle(viewModel.coinName)
        //}
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}
