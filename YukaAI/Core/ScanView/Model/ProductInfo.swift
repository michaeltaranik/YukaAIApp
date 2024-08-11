//
//  Product.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.07.2024.
//

import Foundation




struct Results: Codable {
    let product: ProductInfo
}

//MARK: - Pulic API


struct ProductInfo: Codable {
    let id: String?
    let keywords: [String]?
    let additivesTags: [String]?
    let allergens, brandOwner, brandOwnerImported, brands: String?
    let genericName, genericNameEn, productID: String?
    let imageURL: String?
    let ingredientsHierarchy: [String]?
    let nutriments: Nutriments
    let nutriscoreData: NutriscoreData
    let nutriscoreGrade: String?
    let nutriscoreScore: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case keywords = "_keywords"
        case additivesTags = "additives_tags"
        case allergens
        case brandOwner = "brand_owner"
        case brandOwnerImported = "brand_owner_imported"
        case brands
        case genericName = "generic_name"
        case genericNameEn = "generic_name_en"
        case productID = "id"
        case imageURL = "image_url"
        case ingredientsHierarchy = "ingredients_hierarchy"
        case nutriments
        case nutriscoreData = "nutriscore_data"
        case nutriscoreGrade = "nutriscore_grade"
        case nutriscoreScore = "nutriscore_score"
    }
}

// MARK: - Nutriments
struct Nutriments: Codable {
    let calcium, calcium100G, calciumServing: Double?
    let calciumUnit: String?
    let calciumValue: Double?
    let carbohydrates, carbohydrates100G: Double?
    let carbohydratesServing: Double?
    let carbohydratesUnit: String?
    let carbohydratesValue: Double?
    let cholesterol100G, cholesterolServing: Double?
    let cholesterolUnit: String?
    let cholesterolValue, energy, energyKcal, energyKcal100G: Double?
    let energyKcalServing: Double?
    let energyKcalUnit: String?
    let energyKcalValue: Double?
    let energyKcalValueComputed: Double?
    let energy100G, energyServing: Double?
    let energyUnit: String?
    let energyValue: Double?
    let fat, fat100G: Double?
    let fatServing: Double?
    let fatUnit: String?
    let fatValue, fiber, fiber100G, fiberServing: Double?
    let fiberUnit: String?
    let fiberValue, fruitsVegetablesLegumesEstimateFromIngredients100G, fruitsVegetablesLegumesEstimateFromIngredientsServing, fruitsVegetablesNutsEstimateFromIngredients100G: Double?
    let fruitsVegetablesNutsEstimateFromIngredientsServing, iron, iron100G, ironServing: Double?
    let ironUnit: String?
    let ironValue: Double?
    let novaGroup, novaGroup100G, novaGroupServing, nutritionScoreFr: Double?
    let nutritionScoreFr100G: Double?
    let proteins, proteins100G: Double?
    let proteinsServing: Double?
    let proteinsUnit: String?
    let proteinsValue, salt, salt100G, saltServing: Double?
    let saltUnit: String?
    let saltValue: Double?

    let saturatedFat, saturatedFat100G, saturatedFatServing: Double?
    let saturatedFatUnit: String?
    let saturatedFatValue, sodium, sodium100G, sodiumServing: Double?
    let sodiumUnit: String?
    let sodiumValue: Double?
    let sugars, sugars100G: Double?
    let sugarsServing: Double?
    let sugarsUnit: String?
    let sugarsValue: Double?
    let transFat, transFat100G, transFatServing: Double?
    let transFatUnit: String?
    let transFatValue: Double?
    let vitaminA, vitaminA100G, vitaminAServing: Double?
    let vitaminAUnit: String?
    let vitaminAValue, vitaminC, vitaminC100G, vitaminCServing: Double?
    let vitaminCUnit: String?
    let vitaminCValue: Double?
    
    enum CodingKeys: String, CodingKey {
        case calcium
        case calcium100G = "calcium_100g"
        case calciumServing = "calcium_serving"
        case calciumUnit = "calcium_unit"
        case calciumValue = "calcium_value"
        case carbohydrates
        case carbohydrates100G = "carbohydrates_100g"
        case carbohydratesServing = "carbohydrates_serving"
        case carbohydratesUnit = "carbohydrates_unit"
        case carbohydratesValue = "carbohydrates_value"
        case cholesterol100G = "cholesterol_100g"
        case cholesterolServing = "cholesterol_serving"
        case cholesterolUnit = "cholesterol_unit"
        case cholesterolValue = "cholesterol_value"
        case energy
        case energyKcal = "energy-kcal"
        case energyKcal100G = "energy-kcal_100g"
        case energyKcalServing = "energy-kcal_serving"
        case energyKcalUnit = "energy-kcal_unit"
        case energyKcalValue = "energy-kcal_value"
        case energyKcalValueComputed = "energy-kcal_value_computed"
        case energy100G = "energy_100g"
        case energyServing = "energy_serving"
        case energyUnit = "energy_unit"
        case energyValue = "energy_value"
        case fat
        case fat100G = "fat_100g"
        case fatServing = "fat_serving"
        case fatUnit = "fat_unit"
        case fatValue = "fat_value"
        case fiber
        case fiber100G = "fiber_100g"
        case fiberServing = "fiber_serving"
        case fiberUnit = "fiber_unit"
        case fiberValue = "fiber_value"
        case fruitsVegetablesLegumesEstimateFromIngredients100G = "fruits-vegetables-legumes-estimate-from-ingredients_100g"
        case fruitsVegetablesLegumesEstimateFromIngredientsServing = "fruits-vegetables-legumes-estimate-from-ingredients_serving"
        case fruitsVegetablesNutsEstimateFromIngredients100G = "fruits-vegetables-nuts-estimate-from-ingredients_100g"
        case fruitsVegetablesNutsEstimateFromIngredientsServing = "fruits-vegetables-nuts-estimate-from-ingredients_serving"
        case iron
        case iron100G = "iron_100g"
        case ironServing = "iron_serving"
        case ironUnit = "iron_unit"
        case ironValue = "iron_value"
        case novaGroup = "nova-group"
        case novaGroup100G = "nova-group_100g"
        case novaGroupServing = "nova-group_serving"
        case nutritionScoreFr = "nutrition-score-fr"
        case nutritionScoreFr100G = "nutrition-score-fr_100g"
        case proteins
        case proteins100G = "proteins_100g"
        case proteinsServing = "proteins_serving"
        case proteinsUnit = "proteins_unit"
        case proteinsValue = "proteins_value"
        case salt
        case salt100G = "salt_100g"
        case saltServing = "salt_serving"
        case saltUnit = "salt_unit"
        case saltValue = "salt_value"
        case saturatedFat = "saturated-fat"
        case saturatedFat100G = "saturated-fat_100g"
        case saturatedFatServing = "saturated-fat_serving"
        case saturatedFatUnit = "saturated-fat_unit"
        case saturatedFatValue = "saturated-fat_value"
        case sodium
        case sodium100G = "sodium_100g"
        case sodiumServing = "sodium_serving"
        case sodiumUnit = "sodium_unit"
        case sodiumValue = "sodium_value"
        case sugars
        case sugars100G = "sugars_100g"
        case sugarsServing = "sugars_serving"
        case sugarsUnit = "sugars_unit"
        case sugarsValue = "sugars_value"
        case transFat = "trans-fat"
        case transFat100G = "trans-fat_100g"
        case transFatServing = "trans-fat_serving"
        case transFatUnit = "trans-fat_unit"
        case transFatValue = "trans-fat_value"
        case vitaminA = "vitamin-a"
        case vitaminA100G = "vitamin-a_100g"
        case vitaminAServing = "vitamin-a_serving"
        case vitaminAUnit = "vitamin-a_unit"
        case vitaminAValue = "vitamin-a_value"
        case vitaminC = "vitamin-c"
        case vitaminC100G = "vitamin-c_100g"
        case vitaminCServing = "vitamin-c_serving"
        case vitaminCUnit = "vitamin-c_unit"
        case vitaminCValue = "vitamin-c_value"
    }
}

// MARK: - NutriscoreData
struct NutriscoreData: Codable {
    let energy, energyPoints, energyValue: Double?
    let fiber: Double?
    let fiberPoints: Double?
    let fiberValue: Double?
    let grade: String?
    let isBeverage, isCheese, isFat, isWater: Double?
    let negativePoints, positivePoints: Double?
    let proteins: Double?
    let proteinsPoints: Double?
    let proteinsValue, saturatedFat: Double?
    let saturatedFatPoints: Double?
    let saturatedFatValue: Double?
    let score, sodium, sodiumPoints, sodiumValue: Double?
    let sugars: Double?
    let sugarsPoints: Double?
    let sugarsValue: Double?
    
    enum CodingKeys: String, CodingKey {
        case energy
        case energyPoints = "energy_points"
        case energyValue = "energy_value"
        case fiber
        case fiberPoints = "fiber_points"
        case fiberValue = "fiber_value"
        case grade
        case isBeverage = "is_beverage"
        case isCheese = "is_cheese"
        case isFat = "is_fat"
        case isWater = "is_water"
        case negativePoints = "negative_points"
        case positivePoints = "positive_points"
        case proteins
        case proteinsPoints = "proteins_points"
        case proteinsValue = "proteins_value"
        case saturatedFat = "saturated_fat"
        case saturatedFatPoints = "saturated_fat_points"
        case saturatedFatValue = "saturated_fat_value"
        case score, sodium
        case sodiumPoints = "sodium_points"
        case sodiumValue = "sodium_value"
        case sugars
        case sugarsPoints = "sugars_points"
        case sugarsValue = "sugars_value"
    }
}







//MARK: - Local Host
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
//    }
//}
//
//
//struct Product: Codable {
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
//    }
//}
//
//struct NutrientLevels: Codable {
//    let fat: String
//    let salt: String
//    let saturatedFat: String
//    let sugars: String
//
//    enum CodingKeys: String, CodingKey {
//        case fat
//        case salt
//        case saturatedFat = "saturated_fat"
//        case sugars
//    }
//}
//
//struct Nutriments: Codable {
//    let energyKcal: Double
//    let energyKcal100g: Double
//    let energyKcalValue: Double
//    let energyKcalUnit: String
//    let energyKj: Double
//    let energyKj100g: Double
//    let energyKjValue: Double
//    let energyKjUnit: String
//    let fat: Double
//    let fat100g: Double
//    let fatUnit: String
//    let carbohydrates: Double
//    let carbohydrates100g: Double
//    let carbohydratesUnit: String
//    let fiber: Double
//    let fiber100g: Double
//    let fiberUnit: String
//    let sugars: Double
//    let sugars100g: Double
//    let sugarsUnit: String
//    let saturatedFat: Double
//    let saturatedFat100g: Double
//    let saturatedFatUnit: String
//    let proteins: Double
//    let proteins100g: Double
//    let proteinsUnit: String
//    let salt: Double
//    let salt100g: Double
//    let saltUnit: String
//    let novaGroup: Int
//    let nutritionScoreFr: Int
//    let nutritionScoreFr100g: Int
//
//    enum CodingKeys: String, CodingKey {
//        case energyKcal = "energy_kcal"
//        case energyKcal100g = "energy_kcal_100g"
//        case energyKcalValue = "energy_kcal_value"
//        case energyKcalUnit = "energy_kcal_unit"
//        case energyKj = "energy_kj"
//        case energyKj100g = "energy_kj_100g"
//        case energyKjValue = "energy_kj_value"
//        case energyKjUnit = "energy_kj_unit"
//        case fat
//        case fat100g = "fat_100g"
//        case fatUnit = "fat_unit"
//        case carbohydrates
//        case carbohydrates100g = "carbohydrates_100g"
//        case carbohydratesUnit = "carbohydrates_unit"
//        case fiber
//        case fiber100g = "fiber_100g"
//        case fiberUnit = "fiber_unit"
//        case sugars
//        case sugars100g = "sugars_100g"
//        case sugarsUnit = "sugars_unit"
//        case saturatedFat = "saturated_fat"
//        case saturatedFat100g = "saturated_fat_100g"
//        case saturatedFatUnit = "saturated_fat_unit"
//        case proteins
//        case proteins100g = "proteins_100g"
//        case proteinsUnit = "proteins_unit"
//        case salt
//        case salt100g = "salt_100g"
//        case saltUnit = "salt_unit"
//        case novaGroup = "nova_group"
//        case nutritionScoreFr = "nutrition_score_fr"
//        case nutritionScoreFr100g = "nutrition_score_fr_100g"
//    }
//}

