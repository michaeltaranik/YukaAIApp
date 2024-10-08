//
//  RBarChartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.10.2024.
//

import SwiftUI

struct BarChartCoreView: View {
    let barData: [Double]
    let maxValue: CGFloat
    let labels: [String]
    
    var width = UIScreen.screenWidth * 0.75
    var height = UIScreen.screenHeight * 0.4
    
    private var barSpacing: CGFloat {
        width / (CGFloat(labels.count * 2) - 1)
    }
    
    private var verticalLineSpacing: CGFloat {
        height / 2.325
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            BarChartGround(
                maxValue: maxValue,
                labels: labels,
                groundWidth: width,
                groundHeight: height,
                labelsSpacing: barSpacing,
                verticalSpacing: verticalLineSpacing
            )
            
            BarsView(
                data: barData,
                maxValue: maxValue,
                width: width,
                height: height,
                barSpacing: barSpacing,
                barWidth: barSpacing
            )
            .padding(.bottom, verticalLineSpacing / 5)
        }
        .frame(width: width * 1.2, height: height)

    }
}

#Preview {
    BarChartCoreView(
        barData: [
            7500, 8500, 9500, 12000, 10000, 9500, 8000, 8500, 7800, 6000, 5000, 4000
        ],
        maxValue: 13000,
        labels: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
    )
    .padding()
}

