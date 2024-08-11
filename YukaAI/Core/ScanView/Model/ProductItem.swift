//
//  ProductItem.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.07.2024.
//

import Foundation
import SwiftUI



struct ProductItem: Hashable, Identifiable, Codable {
    
    var id = UUID()
    
    // generic
    let barcode: String
    let keywords: [String]
    let additivesTags: [String]
    let genericName: String
    let imageUrl: String
    let ingredientsHierarchy: [String]
    let nutriscore: Int
    
    // Nutriments
    
    let energy: String
    
    // macros
    let fat: String
    let carbohydrates: String
    let protein: String
    let fiber: String
    
    // additional
    let salt: String
    let sugar: String
    let saturatedFat: String
    let transFat: String
    
    // vitamins
    let vitaminA: String
    let vitaminC: String

    // minerals
    let calcium: String
    let iron: String
    let cholesterol: String
    
    init(results: Results, score: Int) {
        self.barcode = results.product.id ?? ""
        self.keywords = results.product.keywords ?? []
        self.additivesTags = results.product.additivesTags ?? []
        self.genericName = results.product.genericName ?? ""
        self.imageUrl = results.product.imageURL ?? ""
        self.ingredientsHierarchy = results.product.ingredientsHierarchy ?? []
        self.energy = "\(results.product.nutriments.energy100G ?? 0.0) \(results.product.nutriments.energyUnit ?? "g")"
        self.fat = "\(results.product.nutriments.fat100G ?? 0.0) \(results.product.nutriments.fatUnit ?? "g")"
        self.carbohydrates = "\(results.product.nutriments.carbohydrates100G ?? 0.0) \(results.product.nutriments.carbohydratesUnit ?? "g")"
        self.protein = "\(results.product.nutriments.proteins100G ?? 0.0) \(results.product.nutriments.proteinsUnit ?? "g")"
        self.fiber = "\(results.product.nutriments.fiber100G ?? 0.0) \(results.product.nutriments.fiberUnit ?? "g")"
        self.salt = "\(results.product.nutriments.salt100G ?? 0.0) \(results.product.nutriments.saltUnit ?? "g")"
        self.sugar = "\(results.product.nutriments.sugars100G ?? 0.0) \(results.product.nutriments.sugarsUnit ?? "g")"
        self.saturatedFat = "\(results.product.nutriments.saturatedFat100G ?? 0.0) \(results.product.nutriments.saturatedFatUnit ?? "g")"
        self.transFat = "\(results.product.nutriments.transFat100G ?? 0.0) \(results.product.nutriments.transFatUnit ?? "g")"
        self.vitaminA = "\(results.product.nutriments.vitaminA100G ?? 0.0) \(results.product.nutriments.vitaminAUnit ?? "g")"
        self.vitaminC = "\(results.product.nutriments.vitaminC100G ?? 0.0) \(results.product.nutriments.vitaminCUnit ?? "g")"
        self.calcium = "\(results.product.nutriments.calcium100G ?? 0.0) \(results.product.nutriments.calciumUnit ?? "g")"
        self.iron = "\(results.product.nutriments.iron100G ?? 0.0) \(results.product.nutriments.ironUnit ?? "g")"
        self.cholesterol = "\(results.product.nutriments.cholesterol100G ?? 0.0) \(results.product.nutriments.cholesterolUnit ?? "g")"
        self.nutriscore = score
    }

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(barcode + imageUrl)
    }
    
    static func == (lhs: ProductItem, rhs: ProductItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}







