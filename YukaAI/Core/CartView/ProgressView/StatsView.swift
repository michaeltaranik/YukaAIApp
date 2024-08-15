//
//  ProgressView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct StatsView: View {
    
    
    let demo: [Double] = [1.5,2,3]
    let data = ChartData(points: [8,23,54,32,12,37,7,23,43])
    let title: String = "Your Progress"
    
    var body: some View {
        VStack {
            PieChartView(data: demo,
                         title: title,
                         legend: "All",
                         style: Styles.barChartCustomStylePink,
                         form: ChartForm.extraLarge,
                         dropShadow: true,
                         valueSpecifier: "%.0f")
            BarChartView(data: TestData.scans,
                         title: "Your Scans",
                         legend: "All",
                         style: Styles.barChartCustomStylePink,
                         form: ChartForm.extraLarge,
                         dropShadow: true,
                         cornerImage: Image(systemName: "camera.viewfinder"),
                         valueSpecifier: "%.0f",
                         animatedToBack: true)
            
        }
    }
}

#Preview {
    StatsView()
}
