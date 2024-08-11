//
//  Data.swift
//  YukaAI
//
//  Created by Michael Taranik on 20.07.2024.
//

import Foundation
import SwiftUI



class DataManager: ObservableObject {
    
        
    static let baseUrlString = "https://world.openfoodfacts.org/api/v3/product/"
    static let searchString = "https://world.openfoodfacts.org/cgi/search.pl"
    
    private static let localUrlString = "https://9fa8-178-197-214-16.ngrok-free.app/product/"
    
    
    
    static func getDataResults(barcode: String) async throws -> Results {
                
        let URLstring = baseUrlString + "3045140105502" + ".json"
        print(URLstring)
        guard let url = URL(string: URLstring) else { throw UserError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Results.self, from: data)
        } catch {
            throw UserError.invalidData
        } 
    }
    
    
    static func computeNutritionScore(for food: Results) -> Int {
        var score = 0

        if let energy = food.product.nutriments.energy100G {
            switch energy {
            case ..<100:
                score += 10
            case 100..<200:
                score += 7
            case 200..<300:
                score += 4
            default:
                score += 0
            }
        }
        
        if let fat = food.product.nutriments.fat100G {
            switch fat {
            case ..<3:
                score += 10
            case 3..<6:
                score += 7
            case 6..<10:
                score += 4
            default:
                score += 0
            }
        }
        
        
        if let carbs = food.product.nutriments.carbohydrates100G {
            switch carbs {
            case ..<20:
                score += 10
            case 20..<40:
                score += 7
            case 40..<60:
                score += 4
            default:
                score += 0
            }
        }
        
        if let protein = food.product.nutriments.proteins100G {
            switch protein {
            case 10...:
                score += 10
            case 5..<10:
                score += 7
            default:
                score += 4
            }
        }
        
        if let fiber = food.product.nutriments.fiber100G {
            switch fiber {
            case 5...:
                score += 10
            case 3..<5:
                score += 7
            default:
                score += 4
            }
        }
        
        if let salt = food.product.nutriments.salt100G {
            switch salt {
            case ..<140:
                score += 10
            case 140..<300:
                score += 7
            default:
                score += 0
            }
        }
        
        if let sugar = food.product.nutriments.sugars100G {
            switch sugar {
            case ..<5:
                score += 10
            case 5..<10:
                score += 7
            default:
                score += 0
            }
        }
        
        if let saturated = food.product.nutriments.saturatedFat100G {
            switch saturated {
            case ..<1:
                score += 10
            case 1..<3:
                score += 7
            default:
                score += 0
            }
        }
        
        if let trans = food.product.nutriments.transFat100G {
            if trans == 0 {
                score += 10
            } else {
                score += 0
            }
        }
        
        if let cholesterol = food.product.nutriments.cholesterol100G {
            switch cholesterol {
            case ..<100:
                score += 10
            case 100..<200:
                score += 5
            default:
                score += 0
            }
        }
        
        var vitaminScore = 0
        if let vitaminA = food.product.nutriments.vitaminA100G {
            let vitA = vitaminA >= 20 ? 5 : 0
            vitaminScore += vitA
        }
        if let vitaminC = food.product.nutriments.vitaminC100G {
            let vitC = vitaminC >= 20 ? 5 : 0
            vitaminScore += vitC
        }
        
        var mineralScore = 0
        if let calcium = food.product.nutriments.calcium100G {
            let calc = calcium >= 20 ? 5 : 0
            mineralScore += calc
        }
        if let iron = food.product.nutriments.iron100G {
            let iro = iron >= 20 ? 5 : 0
            mineralScore += iro
        }
        
        
        score += (vitaminScore + mineralScore)
        
        let maxScore = 100 
        let normalizedScore = min(maxScore, score)
        
        return normalizedScore
    }
    
    
}
