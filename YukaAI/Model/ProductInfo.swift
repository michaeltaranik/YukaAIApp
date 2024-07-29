//
//  Product.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.07.2024.
//

import Foundation



//struct ProductInfo: Codable {
//    let id: String
//    let product_name: String
//    let labels: String
//    let nutriscore_tags: [String]
//    let nutrient_levels: NutrientLevels
//    let additive_tags: [String]
//    let nutriments: Nutriments
//    let image_urls: [String]
//}
//
//struct NutrientLevels: Codable {
//    let fat: String
//    let salt: String
//    let saturated_fat: String
//    let sugars: String
//}
//
//struct Nutriments: Codable {
//    let energy_kcal: Double
//    let energy_kcal_100g: Double
//    let energy_kcal_value: Double
//    let energy_kcal_unit: String
//    let energy_kj: Double
//    let energy_kj_100g: Double
//    let energy_kj_value: Double
//    let energy_kj_unit: String
//    let fat: Double
//    let fat_100g: Double
//    let fat_unit: String
//    let carbohydrates: Double
//    let carbohydrates_100g: Double
//    let carbohydrates_unit: String
//    let fiber: Double
//    let fiber_100g: Double
//    let fiber_unit: String
//    let sugars: Double
//    let sugars_100g: Double
//    let sugars_unit: String
//    let saturated_fat: Double
//    let saturated_fat_100g: Double
//    let saturated_fat_unit: String
//    let proteins: Double
//    let proteins_100g: Double
//    let proteins_unit: String
//    let salt: Double
//    let salt_100g: Double
//    let salt_unit: String
//    let nova_group: Int
//    let nutrition_score_fr: Int
//    let nutrition_score_fr_100g: Int
//}





//struct ProductInfo: Codable {
//    let id: String
//    let productName: String
//    let labels: String
//    let nutriscoreTags: [String]
//    let nutrientLevels: NutrientLevels
//    let additivesTags: [String]
//    let nutriments: Nutriments
//    let imageUrls: [String]
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case productName = "product_name"
//        case labels
//        case nutriscoreTags = "nutriscore_tags"
//        case nutrientLevels = "nutrient_levels"
//        case additivesTags = "additives_tags"
//        case nutriments
//        case imageUrls = "image_urls"
//        
//        
//        
//        struct Product: Codable {
//            let id: String
//            let productName: String
//            let labels: String
//            let nutriscoreTags: [String]
//            let nutrientLevels: NutrientLevels
//            let additivesTags: [String]
//            let nutriments: Nutriments
//            let imageUrls: [String]
//            
//            enum CodingKeys: String, CodingKey {
//                case id
//                case productName = "product_name"
//                case labels
//                case nutriscoreTags = "nutriscore_tags"
//                case nutrientLevels = "nutrient_levels"
//                case additivesTags = "additives_tags"
//                case nutriments
//                case imageUrls = "image_urls"
//            }
//        }
//        
//        struct NutrientLevels: Codable {
//            let fat: String
//            let salt: String
//            let saturatedFat: String
//            let sugars: String
//            
//            enum CodingKeys: String, CodingKey {
//                case fat
//                case salt
//                case saturatedFat = "saturated_fat"
//                case sugars
//            }
//        }
//        
//        struct Nutriments: Codable {
//            let energyKcal: Double
//            let energyKcal100g: Double
//            let energyKcalValue: Double
//            let energyKcalUnit: String
//            let energyKj: Double
//            let energyKj100g: Double
//            let energyKjValue: Double
//            let energyKjUnit: String
//            let fat: Double
//            let fat100g: Double
//            let fatUnit: String
//            let carbohydrates: Double
//            let carbohydrates100g: Double
//            let carbohydratesUnit: String
//            let fiber: Double
//            let fiber100g: Double
//            let fiberUnit: String
//            let sugars: Double
//            let sugars100g: Double
//            let sugarsUnit: String
//            let saturatedFat: Double
//            let saturatedFat100g: Double
//            let saturatedFatUnit: String
//            let proteins: Double
//            let proteins100g: Double
//            let proteinsUnit: String
//            let salt: Double
//            let salt100g: Double
//            let saltUnit: String
//            let novaGroup: Int
//            let nutritionScoreFr: Int
//            let nutritionScoreFr100g: Int
//            
//            enum CodingKeys: String, CodingKey {
//                case energyKcal = "energy_kcal"
//                case energyKcal100g = "energy_kcal_100g"
//                case energyKcalValue = "energy_kcal_value"
//                case energyKcalUnit = "energy_kcal_unit"
//                case energyKj = "energy_kj"
//                case energyKj100g = "energy_kj_100g"
//                case energyKjValue = "energy_kj_value"
//                case energyKjUnit = "energy_kj_unit"
//                case fat
//                case fat100g = "fat_100g"
//                case fatUnit = "fat_unit"
//                case carbohydrates
//                case carbohydrates100g = "carbohydrates_100g"
//                case carbohydratesUnit = "carbohydrates_unit"
//                case fiber
//                case fiber100g = "fiber_100g"
//                case fiberUnit = "fiber_unit"
//                case sugars
//                case sugars100g = "sugars_100g"
//                case sugarsUnit = "sugars_unit"
//                case saturatedFat = "saturated_fat"
//                case saturatedFat100g = "saturated_fat_100g"
//                case saturatedFatUnit = "saturated_fat_unit"
//                case proteins
//                case proteins100g = "proteins_100g"
//                case proteinsUnit = "proteins_unit"
//                case salt
//                case salt100g = "salt_100g"
//                case saltUnit = "salt_unit"
//                case novaGroup = "nova_group"
//                case nutritionScoreFr = "nutrition_score_fr"
//                case nutritionScoreFr100g = "nutrition_score_fr_100g"
//            }
//        }
//    }
//}
