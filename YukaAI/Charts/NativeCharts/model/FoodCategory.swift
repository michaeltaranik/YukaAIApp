//
//  FoodCategory.swift
//  YukaAI
//
//  Created by Michael Taranik on 11.11.2024.
//

import Foundation

enum FoodCategory: String, Identifiable, CaseIterable {
    case beverage
    case dairy
    case fruit
    case vegetable
    case meat
    case fish
    case grain
    case legume
    case nuts
    case starchy
    case other
    
    var id: Self { return self }
    
    var displayName: String {
        switch self {
        case .beverage: return "Beverage"
        case .dairy: return "Dairy"
        case .fruit: return "Fruit"
        case .vegetable: return "Vegetable"
        case .meat: return "Meat"
        case .fish: return "Fish"
        case .grain: return "Grain"
        case .legume: return "Legume"
        case .nuts: return "Nuts"
        case .starchy: return "Starchy"
        case .other: return "Other"
        }
    }
}
