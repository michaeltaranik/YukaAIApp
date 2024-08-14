//
//  LocalResults.swift
//  YukaAI
//
//  Created by Michael Taranik on 14.08.2024.
//

import Foundation




struct LocalResults: Codable {
    let id, productName, labels: String?
    let nutriscoreTags: [String]?
    let nutrientLevels: NutrientLevels?
    let additivesTags: [String]?
    let nutriments: Macros?
    let maxImgid: String?
    let imageURL: String?
    let keywords: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case productName = "product_name"
        case labels
        case nutriscoreTags = "nutriscore_tags"
        case nutrientLevels = "nutrient_levels"
        case additivesTags = "additives_tags"
        case nutriments
        case maxImgid = "max_imgid"
        case imageURL = "imageUrl"
        case keywords = "Keywords"
    }
}

// MARK: - NutrientLevels
struct NutrientLevels: Codable {
    let fat, salt, saturatedFat, sugars: String?

    enum CodingKeys: String, CodingKey {
        case fat, salt
        case saturatedFat = "saturated_fat"
        case sugars
    }
}

// MARK: - Nutriments
struct Macros: Codable {
    let energyKcal, energyKcal100G, energyKcalValue: Int?
    let energyKcalUnit: String?
    let energyKj, energyKj100G, energyKjValue: Int?
    let energyKjUnit: String?
    let fat, fat100G: Double?
    let fatUnit: String?
    let carbohydrates, carbohydrates100G: Double?
    let carbohydratesUnit: String?
    let fiber, fiber100G: Int?
    let fiberUnit: String?
    let sugars, sugars100G: Double?
    let sugarsUnit: String?
    let saturatedFat, saturatedFat100G: Int?
    let saturatedFatUnit: String?
    let proteins, proteins100G: Double?
    let proteinsUnit: String?
    let salt, salt100G: Double?
    let saltUnit: String?
    let novaGroup, nutritionScoreFr, nutritionScoreFr100G: Int?

    enum CodingKeys: String, CodingKey {
        case energyKcal = "energy_kcal"
        case energyKcal100G = "energy_kcal_100g"
        case energyKcalValue = "energy_kcal_value"
        case energyKcalUnit = "energy_kcal_unit"
        case energyKj = "energy_kj"
        case energyKj100G = "energy_kj_100g"
        case energyKjValue = "energy_kj_value"
        case energyKjUnit = "energy_kj_unit"
        case fat
        case fat100G = "fat_100g"
        case fatUnit = "fat_unit"
        case carbohydrates
        case carbohydrates100G = "carbohydrates_100g"
        case carbohydratesUnit = "carbohydrates_unit"
        case fiber
        case fiber100G = "fiber_100g"
        case fiberUnit = "fiber_unit"
        case sugars
        case sugars100G = "sugars_100g"
        case sugarsUnit = "sugars_unit"
        case saturatedFat = "saturated_fat"
        case saturatedFat100G = "saturated_fat_100g"
        case saturatedFatUnit = "saturated_fat_unit"
        case proteins
        case proteins100G = "proteins_100g"
        case proteinsUnit = "proteins_unit"
        case salt
        case salt100G = "salt_100g"
        case saltUnit = "salt_unit"
        case novaGroup = "nova_group"
        case nutritionScoreFr = "nutrition_score_fr"
        case nutritionScoreFr100G = "nutrition_score_fr_100g"
    }
}
