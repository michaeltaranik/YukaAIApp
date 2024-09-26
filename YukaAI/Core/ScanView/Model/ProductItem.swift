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
    var barcode: String
    var keywords: [String]
    var additivesTags: [String]
    var genericName: String
    var imageUrl: String
    var ingredientsHierarchy: [String]?
    var nutriscore: Int?
    
    // Nutriments
    
    var energy: String?
    
    // macros
    var fat: String?
    var carbohydrates: String?
    var protein: String?
    var fiber: String?
    
    // additional
    var salt: String?
    var sugar: String?
    var saturatedFat: String?
    var transFat: String?
    
    // vitamins
    var vitaminA: String?
    var vitaminC: String?

    // minerals
    var calcium: String?
    var iron: String?
    var cholesterol: String?
    
    
    init(results: GlobalResults) {
        self.barcode = results.product.id ?? ""
        self.keywords = results.product.keywords ?? []
        self.additivesTags = results.product.additivesTags ?? []
        self.genericName = results.product.productName ?? ""
        self.imageUrl = results.product.imageURL ?? ""
        self.ingredientsHierarchy = results.product.ingredientsHierarchy ?? []
        self.energy = "\(results.product.nutriments.energyKcal100G?.roundToOnePlace() ?? "0.0") \(results.product.nutriments.energyKcalUnit ?? "kcal")"
        self.fat = "\(results.product.nutriments.fat100G?.roundToOnePlace() ?? "0.0") \(results.product.nutriments.fatUnit ?? "g")"
        self.carbohydrates = "\(results.product.nutriments.carbohydrates100G?.roundToOnePlace() ?? "0.0") \(results.product.nutriments.carbohydratesUnit ?? "g")"
        self.protein = "\(results.product.nutriments.proteins100G?.roundToOnePlace() ?? "0.0") \(results.product.nutriments.proteinsUnit ?? "g")"
        self.fiber = "\(results.product.nutriments.fiber100G?.roundToOnePlace() ?? "0.0") \(results.product.nutriments.fiberUnit ?? "g")"
        self.salt = "\(results.product.nutriments.salt100G?.roundToOnePlace() ?? "0.0") \(results.product.nutriments.saltUnit ?? "g")"
        self.sugar = "\(results.product.nutriments.sugars100G?.roundToOnePlace() ?? "0.0") \(results.product.nutriments.sugarsUnit ?? "g")"
        self.saturatedFat = "\(results.product.nutriments.saturatedFat100G?.roundToOnePlace() ?? "0.0") \(results.product.nutriments.saturatedFatUnit ?? "g")"
        self.transFat = "\(results.product.nutriments.transFat100G?.roundToOnePlace() ?? "0.0") \(results.product.nutriments.transFatUnit ?? "g")"
        
        self.vitaminA = "\(results.product.nutriments.vitaminA100G ?? 0.0) \(results.product.nutriments.vitaminAUnit ?? "mg")"
        self.vitaminC = "\(results.product.nutriments.vitaminC100G ?? 0.0) \(results.product.nutriments.vitaminCUnit ?? "mg")"
        self.calcium = "\(results.product.nutriments.calcium100G ?? 0.0) \(results.product.nutriments.calciumUnit ?? "mg")"
        self.iron = "\(results.product.nutriments.iron100G ?? 0.0) \(results.product.nutriments.ironUnit ?? "mg")"
        self.cholesterol = "\(results.product.nutriments.cholesterol100G ?? 0.0) \(results.product.nutriments.cholesterolUnit ?? "mg")"
    }
    
    init(results: LocalResults) {
        self.barcode = results.id ?? ""
        self.keywords = results.keywords ?? []
        self.additivesTags = results.additivesTags ?? []
        self.genericName = results.productName ?? ""
        self.imageUrl = results.imageURL ?? ""
        self.energy = "\(results.nutriments?.energyKcal100G ?? 0) \(results.nutriments?.energyKcalUnit ?? "kcal")"
        self.fat = "\(results.nutriments?.fat100G?.roundToOnePlace() ?? "0.0") \(results.nutriments?.fatUnit ?? "g")"
        self.carbohydrates = "\(results.nutriments?.carbohydrates100G?.roundToOnePlace() ?? "0.0") \(results.nutriments?.carbohydratesUnit ?? "g")"
        self.protein = "\(results.nutriments?.proteins100G ?? 0) \(results.nutriments?.proteinsUnit ?? "g")"
        self.fiber = "\(results.nutriments?.fiber100G ?? 0) \(results.nutriments?.fiberUnit ?? "g")"
        self.salt = "\(results.nutriments?.salt100G?.roundToOnePlace() ?? "0.0") \(results.nutriments?.saltUnit ?? "g")"
        self.sugar = "\(results.nutriments?.sugars100G?.roundToOnePlace() ?? "0.0") \(results.nutriments?.sugarsUnit ?? "g")"
        self.saturatedFat = "\(results.nutriments?.saturatedFat100G ?? 0) \(results.nutriments?.saturatedFatUnit ?? "g")"
        self.nutriscore = results.nutriscore?.twentyThree?.data?.positivePoints
    }

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(barcode + imageUrl)
    }
    
    static func == (lhs: ProductItem, rhs: ProductItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}







