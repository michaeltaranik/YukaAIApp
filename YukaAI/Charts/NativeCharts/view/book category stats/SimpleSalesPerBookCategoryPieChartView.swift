//
//  SimpleSalesPerBookPieChartView.swift
//  BookstoreStategist
//
//  Created by Karin Prater on 17.07.23.
//

import SwiftUI
import Charts

struct SimpleSalesPerBookCategoryPieChartView: View {
    @ObservedObject var salesViewModel: SalesViewModel
  
    var body: some View {
        HStack(spacing: 30) {
            SalesPerBookCategoryHeaderView(selectedChartStyle: .pie,
                                           salesViewModel: salesViewModel)
            
            if #available(macOS 14.0, *) {
                Chart(salesViewModel.totalSalesPerCategory, id: \.category) { data in
                    if #available(iOS 17.0, *) {
                        SectorMark(
                            angle: .value("Sales", data.sales),
                            innerRadius: .ratio(0.618),
                            angularInset: 1.5
                        )
                        .cornerRadius(5.0)
                        .opacity(data.category == salesViewModel.bestSellingCategory?.category ? 1 : 0.3)
                    } else {
                        // Fallback on earlier versions
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 75)
            }
        }
    }
}


#Preview {
    SimpleSalesPerBookCategoryPieChartView(salesViewModel: .preview)
        .padding()
}
