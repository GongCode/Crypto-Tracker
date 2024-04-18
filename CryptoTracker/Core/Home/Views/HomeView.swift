//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Jason Gong on 1/4/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                //Top Movers
                TopMoversView(viewModel: viewModel)
                
                Divider()
                
                //All Coins
                AllCoinsView(viewModel: viewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
