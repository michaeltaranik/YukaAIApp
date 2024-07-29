//
//  Results.swift
//  YukaAI
//
//  Created by Michael Taranik on 21.07.2024.
//

import Foundation


struct Results: Codable {
    let product: Product?
    
    
}


struct Product: Codable {
    let id: String
    let generic_name: String?
    let product_name: String?
    let nutrient_levels: NutrientLevels?
    let nutriments: Nutriments
    let image_url: String?
}


struct NutrientLevels: Codable {
    let fat: String?
    let salt: String?
    let sugars: String?
}


struct Nutriments: Codable {
    let energy_value: Double?
    let fat_100g: Double?
    let carbohydrates_100g: Double?
    let proteins_100g: Double?
    let fiber_100g: Double?
    let sugars_100g: Double?
}
