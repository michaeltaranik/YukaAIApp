//
//  NutritionScore.swift
//  YukaAI
//
//  Created by Michael Taranik on 11.08.2024.
//

import Foundation

struct NutritionInfo {
    let calories: Int
    let sugar: Int // grams
    let saturatedFat: Int // grams
    let sodium: Int // milligrams
    let fiber: Int // grams
    let protein: Int // grams
    let vitamins: Int // %DV (Daily Value)
}

func computeNutritionScore(for food: NutritionInfo) -> Double {
    var score = 0.0

    // Calories Scoring
    switch food.calories {
    case ..<100:
        score += 20
    case 100..<200:
        score += 15
    case 200..<300:
        score += 10
    default:
        score += 0
    }
    
    // Sugar Scoring
    switch food.sugar {
    case ..<5:
        score += 20
    case 5..<10:
        score += 10
    default:
        score += 0
    }
    
    // Saturated Fat Scoring
    switch food.saturatedFat {
    case ..<1:
        score += 20
    case 1..<3:
        score += 10
    default:
        score += 0
    }
    
    // Sodium Scoring
    switch food.sodium {
    case ..<140:
        score += 20
    case 140..<300:
        score += 10
    default:
        score += 0
    }
    
    // Fiber Scoring
    switch food.fiber {
    case 5...:
        score += 20
    case 3..<5:
        score += 10
    default:
        score += 0
    }
    
    // Protein Scoring
    switch food.protein {
    case 10...:
        score += 20
    case 5..<10:
        score += 10
    default:
        score += 0
    }
    
    // Vitamins/Minerals Scoring
    switch food.vitamins {
    case 20...:
        score += 20
    case 10..<20:
        score += 10
    default:
        score += 0
    }

    // Normalize the score to a scale of 0-100
    let maxScore = 140.0 // Maximum possible score from all components
    let normalizedScore = (score / maxScore) * 100.0
    
    return normalizedScore
}

