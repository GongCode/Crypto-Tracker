//
//  StatsView.swift
//  CryptoTracker
//
//  Created by Jason Gong on 1/4/23.
//

import SwiftUI

struct StatsView: View {
    let model: StatsModel
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(.caption)
            Text(model.value)
                .font(.headline)
            
            if let percentChange = model.percentageChange {
                HStack(spacing: 4) {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                    
                    Text(percentChange.toPercentString())
                        .font(.caption)
                        .bold()
                }
                .foregroundColor(.green)
            }

        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(model: dev.stat3)
    }
}
