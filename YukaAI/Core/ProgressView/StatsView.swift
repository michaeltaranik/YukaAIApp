//
//  ProgressView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct StatsView: View {
    static let colorback = Color.lightGreen
    
    
    
    let totalScans = 69
    let weeklyScans: [Double] = [1,3,4,3,2,4,5]
    let colors: [Color] = [colorback, colorback,  colorback]
    
    let quality: [Double] = [42,52,69]
    
    let demo: [Double] = [1.5,2,3,3,2,1,2,3]
    let title: String = "Your Progress"

    let gradients = [K.peachPinkGradient, K.yellowOrangeGradient, K.greenCyanGradient]
    let linGradients = [K.peachPinkLinearGradient, K.yellowOrangeLinearGradient, K.greenCyanLinearGradient]
    
    var body: some View {
//        ScrollView {
            VStack {
//                LineChartView(data: weeklyScans, title: "Your Scans", rateValue: 13)
//                BarChartView(data: TestData.scans, title: title)
                PieChartView(
                    data: quality,
                    title: "Quality Progress",
                    legend: "You are doing great!",
                    backgroundColor: .white,
                    linGradients: linGradients,
                    radGradients: gradients)
            }
//        }
    }
}



#Preview {
    StatsView()
}

