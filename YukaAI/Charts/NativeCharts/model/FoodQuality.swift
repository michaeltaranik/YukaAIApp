//
//  FoodQuality.swift
//  YukaAI
//
//  Created by Michael Taranik on 11.11.2024.
//

import Foundation

enum FoodQuality: String, Identifiable, CaseIterable {
    case excellent, good, average, poor, bad
    
    var id: Self { return self }
    
    var displayName: String {
        switch self {
        case .excellent: return "Excellent"
        case .good: return "Good"
        case .average: return "Average"
        case .poor: return "Poor"
        case .bad: return "Bad"
        }
    }
}
