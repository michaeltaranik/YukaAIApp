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
    let genericName: String?
    let productName: String?
    let nutrientLevels: NutrientLevels?
    let nutriments: Nutriments
    let imageUrl: String?
    let ecoscoreData: EcoscoreData?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case genericName = "generic_name"
        case productName = "product_name"
        case nutrientLevels = "nutrient_levels"
        case nutriments = "nutriments"
        case imageUrl = "image_url"
        case ecoscoreData = "ecoscore_data"
    }
    
}



struct EcoscoreData: Codable {
    let grade: String?
    let score: Int?
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
