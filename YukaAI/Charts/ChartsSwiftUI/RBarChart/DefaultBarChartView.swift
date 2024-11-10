//
//  DefaultBarChartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.10.2024.
//

import SwiftUI
import Charts

struct Profit: Identifiable {
    let id: UUID = .init()
    let department: String
    let profit: Double
}

struct DefaultBarChartView: View {
    
    let data: [Profit] = [
        Profit(department: "Production", profit: 15000),
        Profit(department: "Marketing", profit: 8000),
        Profit(department: "Finance", profit: 10000)
    ]
    
    
    var body: some View {
        Chart(data) {
            BarMark(
                x: .value("Department", $0.department),
                y: .value("Profit", $0.profit)
            )
        }
    }
}

#Preview {
    DefaultBarChartView()
}
