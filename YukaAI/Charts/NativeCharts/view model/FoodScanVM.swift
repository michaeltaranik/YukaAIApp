//
//  FoodScanVM.swift
//  YukaAI
//
//  Created by Michael Taranik on 11.11.2024.
//

import Foundation

class FoodScanVM: ObservableObject {
    
    @Published var foodScansData = [FoodScan]()
    
    var totalScans: Int { foodScansData.count }
    
    func findScans(for date: Date) -> [FoodScan] {
        foodScansData.filter { $0.scanDate == date }
    }
}
