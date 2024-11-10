//
//  BarChartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.10.2024.
//

import SwiftUI

struct BarChartView: View {
    
    var title: String = "Count"
    var data: [Double]
    var labels: [String]
    var maxValue: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.system(size: 28, weight: .bold, design: .default))
                .foregroundStyle(Color.theme.primaryText)
            
            BarChartCoreView(
                barData: data,
                maxValue: maxValue,
                labels: labels
            )
        }
        .padding()

    }
}

#Preview {
    BarChartView(
        data: [
            7500, 8500, 9500, 9000, 10000, 9500, 8000, 8500, 7800, 6000, 5000, 4000
        ],
        labels: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"],
        maxValue: 10000
    )
}
