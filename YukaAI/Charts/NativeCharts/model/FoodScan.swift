//
//  ProductScan.swift
//  YukaAI
//
//  Created by Michael Taranik on 11.11.2024.
//

import Foundation

struct FoodScan: Identifiable, Equatable {
    let id: UUID
    let category: FoodCategory
    let quality: FoodQuality
    let scanDate: Date
    
    static func == (lhs: FoodScan, rhs: FoodScan) -> Bool {
        lhs.id == rhs.id
    }
    
    static var example = FoodScan(id: UUID(),
                                  category: .beverage, quality: .good,
                                  scanDate: Date(timeIntervalSinceNow: -7_200_000))
    
    static var examples: [FoodScan] = [
        FoodScan(id: UUID(), category: .fish, quality: .excellent, scanDate: Date(timeIntervalSinceNow: -14_400_000)),
        FoodScan(id: UUID(), category: .beverage, quality: .bad, scanDate: Date(timeIntervalSinceNow: -72_000_000)),
        FoodScan(id: UUID(), category: .fruit, quality: .poor, scanDate: Date(timeIntervalSinceNow: -64_800_000)),
        FoodScan(id: UUID(), category: .vegetable, quality: .average, scanDate: Date(timeIntervalSinceNow: -57_600_000)),
        FoodScan(id: UUID(), category: .legume, quality: .excellent, scanDate: Date(timeIntervalSinceNow: -50_400_000)),
        FoodScan(id: UUID(), category: .meat, quality: .good, scanDate: Date(timeIntervalSinceNow: -43_200_000)),
        FoodScan(id: UUID(), category: .nuts, quality: .good, scanDate: Date(timeIntervalSinceNow: -36_000_000)),
    ]
    
    static func threeMonthsExamples() -> [FoodScan]  {
        let threeMonthsAgo = Calendar.current.date(byAdding: .month, value: -3, to: Date())!
        
        let exampleScans: [FoodScan] = (1...100).map { _ in
            let randomScan = examples.randomElement()!
            
            return randomScan
        }
        
        return exampleScans.sorted { $0.scanDate < $1.scanDate }
    }
}
