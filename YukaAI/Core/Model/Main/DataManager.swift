//
//  Data.swift
//  YukaAI
//
//  Created by Michael Taranik on 20.07.2024.
//

import Foundation
import SwiftUI

class DataManager {
    static let shared = DataManager(); private init() { }
    
//    func fetchProductInfo<T: Codable> (from barcode: String) async throws -> T {
//        //creating URL
//        let url = URLManager.shared.createURL(for: .global, with: .productInfo(barcode: barcode))
//        guard let url = url else { throw UserError.invalidURL }
//        // getting data, response
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let response = response as? HTTPURLResponse,
//              response.statusCode == 200 else {
//            throw UserError.invalidResponse
//        }
//        // trying to decode
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(T.self, from: data)
//        } catch(let error) {
//            print(error)
//            print(error.localizedDescription)
//            throw UserError.invalidData
//        }
//    }
    
    func fetchProductInfoLocal<T: Codable> (from barcode: String) async throws -> T {
        //creating URL
        let url = URLManager.shared.createURL(for: .local, with: .productInfo(barcode: barcode))
        guard let url = url else { throw UserError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = [
//            
//        ]
        request.setValue("\(K.api.bearerToken)", forHTTPHeaderField: "Authorization")
        // getting data, response
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            print(response)
            throw UserError.invalidResponse
        }
        // trying to decode
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch(let error) {
            print(error)
            print(error.localizedDescription)
            print(String(data: data, encoding: .utf8)!)
            throw UserError.invalidData
        }
    }
    
    func postFeedback(image: ImageModel) {
        let url = URLManager.shared.createURL(for: .local, with: .imageAnalyzer)
        guard let url = url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
#warning("rectify")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // rectify
        
        do {
            let jsonData = try JSONEncoder().encode(image)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                    print(response ?? "No response")
                    return
                }
                
                
                print(response ?? "success")
            }
            .resume()
        } catch (let error){
            print(error)
        }
    }
    
    func computeNutritionScore(for food: Codable) -> Int {
        let range = 0...100
        
        return range.randomElement()!
        
//        var score = 0
//
//        if let energy = food.productInfo.nutriments.energy100G {
//            switch energy {
//            case 0..<10:
//                score += 40
//            case ..<100:
//                score += 10
//            case 100..<200:
//                score += 7
//            case 200..<300:
//                score += 4
//            default:
//                score += 0
//            }
//        }
//        
//        if let fat = food.productInfo.nutriments.fat100G {
//            switch fat {
//            case ..<3:
//                score += 10
//            case 3..<6:
//                score += 7
//            case 6..<10:
//                score += 4
//            default:
//                score += 0
//            }
//        }
//        
//        
//        if let carbs = food.productInfo.nutriments.carbohydrates100G {
//            switch carbs {
//            case ..<20:
//                score += 10
//            case 20..<40:
//                score += 7
//            case 40..<60:
//                score += 4
//            default:
//                score += 0
//            }
//        }
//        
//        if let protein = food.productInfo.nutriments.proteins100G {
//            switch protein {
//            case 10...:
//                score += 10
//            case 5..<10:
//                score += 7
//            default:
//                score += 4
//            }
//        }
//        
//        if let fiber = food.productInfo.nutriments.fiber100G {
//            switch fiber {
//            case 5...:
//                score += 10
//            case 3..<5:
//                score += 7
//            default:
//                score += 4
//            }
//        }
//        
//        if let salt = food.productInfo.nutriments.salt100G {
//            switch salt {
//            case ..<140:
//                score += 10
//            case 140..<300:
//                score += 7
//            default:
//                score += 0
//            }
//        }
//        
//        if let sugar = food.productInfo.nutriments.sugars100G {
//            switch sugar {
//            case ..<5:
//                score += 10
//            case 5..<10:
//                score += 7
//            default:
//                score += 0
//            }
//        }
//        
//        if let saturated = food.productInfo.nutriments.saturatedFat100G {
//            switch saturated {
//            case ..<1:
//                score += 10
//            case 1..<3:
//                score += 7
//            default:
//                score += 0
//            }
//        }
//        
//        if let trans = food.productInfo.nutriments.transFat100G {
//            if trans == 0 {
//                score += 10
//            } else {
//                score += 0
//            }
//        }
//        
//        if let cholesterol = food.productInfo.nutriments.cholesterol100G {
//            switch cholesterol {
//            case ..<100:
//                score += 10
//            case 100..<200:
//                score += 5
//            default:
//                score += 0
//            }
//        }
        
//        var vitaminScore = 0
//        if let vitaminA = food.productInfo.product.nutriments.vitaminA100G {
//            let vitA = vitaminA >= 20 ? 5 : 0
//            vitaminScore += vitA
//        }
//        if let vitaminC = food.productInfo.product.nutriments.vitaminC100G {
//            let vitC = vitaminC >= 20 ? 5 : 0
//            vitaminScore += vitC
//        }
//        
//        var mineralScore = 0
//        if let calcium = food.productInfo.product.nutriments.calcium100G {
//            let calc = calcium >= 20 ? 5 : 0
//            mineralScore += calc
//        }
//        if let iron = food.productInfo.product.nutriments.iron100G {
//            let iro = iron >= 20 ? 5 : 0
//            mineralScore += iro
//        }
        
        
//        score += (vitaminScore + mineralScore)
//        
//        let maxScore = 100 
//        let normalizedScore = min(maxScore, score)
//        
//        return normalizedScore
    }
    
    
}
