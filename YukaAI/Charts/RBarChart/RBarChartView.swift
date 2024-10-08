//
//  RBarChartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.10.2024.
//

import SwiftUI

struct RBarChartView: View {
    let title: String
    let value: String
    let barData: [CGFloat]  // The data for each bar (as percentages of the max value)
    let maxValue: CGFloat   // The maximum value for the Y-axis
    let labels: [String]    // Labels for the X-axis (e.g., months)
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title and Value at the top
            Text(title)
                .font(.caption)
                .foregroundColor(.purple)
            
            Text(value)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.purple)
            
            // Bar Chart
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(0..<barData.count, id: \.self) { index in
                    VStack {
                        // Bar
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.purple)
                            .frame(width: 20, height: CGFloat(barData[index]) / maxValue * 200)  // Adjust the height dynamically
                        
                        // Label below each bar
                        Text(labels[index])
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.vertical)
            
            // Optional Y-axis scale (like 0, 5500, 11000)
            HStack {
                Spacer()
                Text("0").font(.caption2).foregroundColor(.gray)
                Spacer()
                Text("\(Int(maxValue / 2))").font(.caption2).foregroundColor(.gray)
                Spacer()
                Text("\(Int(maxValue))").font(.caption2).foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(12)
    }
}

#Preview {
    RBarChartView(
        title: "Count",
        value: "8'900",
        barData: [7500, 8500, 9500, 9000, 10000, 9500, 8000, 8500, 7800, 6000, 5000, 4000], // Example data
        maxValue: 11000,
        labels: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
    )
    .frame(height: 300)
    .padding()}

