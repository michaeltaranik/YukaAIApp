//
//  BarChartTempBack.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.10.2024.
//

import SwiftUI

struct BarChartGround: View {
    
    var maxValue: Double
    var labels: [String]
    var minValue: Double = 0
    var groundWidth: CGFloat = UIScreen.screenWidth * 0.8
    var groundHeight: CGFloat = UIScreen.screenHeight * 0.4
    var labelsSpacing: CGFloat = 14
    var verticalSpacing: CGFloat = 150
    
    private var values: [Double] {
        [maxValue, ((minValue + maxValue) / 2), minValue]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: verticalSpacing) {
                ForEach(0..<3) {val in
                    HStack(alignment: .bottom) {
                        Rectangle()
                            .frame(width: groundWidth, height: 1)
                        Spacer()
                        Text(String(format: "%.0f", values[val]))
                    }
                    .frame(height: verticalSpacing / 6)
                }
            }
            
            HStack(spacing: labelsSpacing) {
                ForEach(labels, id: \.self) {label in
                    Text(label)
                        .font(.system(size: labelsSpacing))
                        .frame(width: labelsSpacing)
                }
            }
            .frame(height: verticalSpacing / 6)
            
        }
        .foregroundStyle(Color.theme.secondaryText)
    }
}

#Preview {
    BarChartGround(
        maxValue: 100,
        labels: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
    )
}
