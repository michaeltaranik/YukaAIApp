//
//  SalesPerBookCategoryView.swift
//  BookstoreStategist
//
//  Created by Karin Prater on 17.07.23.
//

import SwiftUI
import Charts

@available(macOS 14.0, *)
struct SalesPerBookCategoryPieChartView: View {
    
    @ObservedObject var salesViewModel: SalesViewModel
    
    var body: some View {
        
        Chart(salesViewModel.totalSalesPerCategory, id: \.category) { data in
            if #available(iOS 17.0, *) {
                SectorMark(
                    angle: .value("Sales", data.sales),
                    innerRadius: .ratio(0.618),
                    angularInset: 1.5
                )
                .cornerRadius(5.0)
                .foregroundStyle(by: .value("Name", data.category.displayName))
                .opacity(data.category == salesViewModel.bestSellingCategory?.category ? 1 : 0.3)
            } else {
                // Fallback on earlier versions
            }
        }
        .chartLegend(alignment: .center, spacing: 18)
        .aspectRatio(1, contentMode: .fit)
        
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if #available(iOS 17.0, *) {
                    let frame = geometry[chartProxy.plotFrame!]
                    
                    
                    if let bestSellingCategory = salesViewModel.bestSellingCategory {
                        VStack {
                            Text("Most Sold Category")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                            Text(bestSellingCategory.category.displayName)
                            
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                            Text(bestSellingCategory.sales.formatted() + " sold")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
            }
        }
         
    }
}

@available(macOS 14.0, *) 
#Preview {
    SalesPerBookCategoryPieChartView(salesViewModel: .preview)
}
