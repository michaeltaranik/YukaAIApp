//
//  LocalResults.swift
//  YukaAI
//
//  Created by Michael Taranik on 14.08.2024.
//

//"nutriscore": {
//    "2021": {
//        "data": {
//            "energy": 2278,
//            "energy_points": 6,
//            "energy_value": 2278,
//            "fiber": 0,
//            "fiber_points": 0,
//            "fiber_value": 0,
//            "fruits_vegetables_nuts_colza_walnut_olive_oils": 13,
//            "fruits_vegetables_nuts_colza_walnut_olive_oils_points": 0,
//            "fruits_vegetables_nuts_colza_walnut_olive_oils_value": 13,
//            "is_beverage": 0,
//            "is_cheese": 0,
//            "is_fat": 0,
//            "is_water": 0,
//            "negative_points": 26,
//            "positive_points": 0,
//            "proteins": 6,
//            "proteins_points": 3,
//            "proteins_value": 6,
//            "saturated_fat": 11,
//            "saturated_fat_points": 10,
//            "saturated_fat_value": 11,
//            "sodium": 45.6,
//            "sodium_points": 0,
//            "sodium_value": 45.6,
//            "sugars": 56.8,
//            "sugars_points": 10,
//            "sugars_value": 56.8
//        }
//    },
//    "2023": {
//        "data": {
//            "components": {
//                "negative": [
//                    {
//                        "id": "energy",
//                        "points": 6,
//                        "points_max": 10,
//                        "unit": "kJ",
//                        "value": 2278
//                    },
//                    {
//                        "id": "sugars",
//                        "points": 15,
//                        "points_max": 15,
//                        "unit": "g",
//                        "value": 56.8
//                    },
//                    {
//                        "id": "saturated_fat",
//                        "points": 10,
//                        "points_max": 10,
//                        "unit": "g",
//                        "value": 11
//                    },
//                    {
//                        "id": "salt",
//                        "points": 0,
//                        "points_max": 20,
//                        "unit": "g",
//                        "value": 0.11
//                    }
//                ],
//                "positive": [
//                    {
//                        "id": "fiber",
//                        "points": 0,
//                        "points_max": 5,
//                        "unit": "g",
//                        "value": 0
//                    },
//                    {
//                        "id": "fruits_vegetables_legumes",
//                        "points": 0,
//                        "points_max": 5,
//                        "unit": "%",
//                        "value": 0
//                    }
//                ]
//            },
//            "count_proteins": 0,
//            "count_proteins_reason": "negative_points_greater_than_or_equal_to_11",
//            "is_beverage": 0,
//            "is_cheese": 0,
//            "is_fat_oil_nuts_seeds": 0,
//            "is_red_meat_product": 0,
//            "is_water": 0,
//            "negative_points": 31,
//            "negative_points_max": 55,
//            "positive_nutrients": [
//                "fiber",
//                "fruits_vegetables_legumes"
//            ],
//            "positive_points": 0,
//            "positive_points_max": 10
//        }
//    }
//}


import Foundation

// MARK: - Welcome
struct LocalResults: Codable {
    var id, productName, labels: String?
    var nutriscoreScore: Double?
    var nutriscoreGrade: String?
    var nutriscore: NutriYears?
    var nutrientLevels: NutrientLevels?
    var additivesTags: [String]?
    var nutriments: Nutriments?
    var maxImgid: String?
    var imageURL: String?
    var keywords: [String]?
    var ingredientsNonNutritiveSweetenersN: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case productName = "product_name"
        case labels
        case nutriscoreScore = "nutriscore_score"
        case nutriscoreGrade = "nutriscore_grade"
        case nutriscore
        case nutrientLevels = "nutrient_levels"
        case additivesTags = "additives_tags"
        case nutriments
        case maxImgid = "max_imgid"
        case imageURL = "imageUrl"
        case keywords = "Keywords"
        case ingredientsNonNutritiveSweetenersN = "ingredients_non_nutritive_sweeteners_n"
    }
}

// MARK: - NutrientLevels
struct NutrientLevels: Codable {
    var fat, salt, saturatedFat, sugars: String?
    
    enum CodingKeys: String, CodingKey {
        case fat, salt
        case saturatedFat = "saturated_fat"
        case sugars
    }
}

// MARK: - Nutriments
struct Nutriments: Codable {
    var energyKcal, energyKcal100G, energyKcalValue: Double?
    var energyKcalUnit: String?
    var energyKj, energyKj100G, energyKjValue: Double?
    var energyKjUnit: String?
    var fat, fat100G: Double?
    var fatUnit: String?
    var carbohydrates, carbohydrates100G: Double?
    var carbohydratesUnit: String?
    var fiber, fiber100G: Double?
    var fiberUnit: String?
    var sugars, sugars100G: Double?
    var sugarsUnit: String?
    var sugarsValue: Double?
    var saturatedFat, saturatedFat100G: Double?
    var saturatedFatUnit: String?
    var saturatedFatValue: Double?
    var sodium, sodium100G: Double?
    var sodiumUnit: String?
    var sodiumValue: Double?
    var transFat, transFat100G, transFatServing: Double?
    var transFatUnit: String?
    var transFatValue, vitaminA, vitaminA100G, vitaminAServing: Double?
    var vitaminAUnit: String?
    var vitaminAValue, vitaminC, vitaminC100G, vitaminCServing: Double?
    var vitaminCUnit: String?
    var vitaminCValue, proteins, proteins100G: Double?
    var proteinsUnit: String?
    var proteinsValue: Double?
    var salt, salt100G: Double?
    var saltUnit: String?
    var saltValue: Double?
    var novaGroup, novaGroup100G, novaGroupServing, nutritionScoreFr: Double?
    var nutritionScoreFr100G, cholesterol100G, cholesterolServing: Double?
    var cholesterolUnit: String?
    var cholesterolValue, calcium, calcium100G, calciumServing: Double?
    var calciumUnit: String?
    var calciumValue, iron, iron100G, ironServing: Double?
    var ironUnit: String?
    var ironValue: Double?
    
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
        case sugarsValue = "sugars_value"
        case saturatedFat = "saturated_fat"
        case saturatedFat100G = "saturated_fat_100g"
        case saturatedFatUnit = "saturated_fat_unit"
        case saturatedFatValue = "saturated_fat_value"
        case sodium
        case sodium100G = "sodium_100g"
        case sodiumUnit = "sodium_unit"
        case sodiumValue = "sodium_value"
        case transFat = "trans_fat"
        case transFat100G = "trans_fat_100g"
        case transFatServing = "trans_fat_serving"
        case transFatUnit = "trans_fat_unit"
        case transFatValue = "trans_fat_value"
        case vitaminA = "vitamin_a"
        case vitaminA100G = "vitamin_a_100g"
        case vitaminAServing = "vitamin_a_serving"
        case vitaminAUnit = "vitamin_a_unit"
        case vitaminAValue = "vitamin_a_value"
        case vitaminC = "vitamin_c"
        case vitaminC100G = "vitamin_c_100g"
        case vitaminCServing = "vitamin_c_serving"
        case vitaminCUnit = "vitamin_c_unit"
        case vitaminCValue = "vitamin_c_value"
        case proteins
        case proteins100G = "proteins_100g"
        case proteinsUnit = "proteins_unit"
        case proteinsValue = "proteins_value"
        case salt
        case salt100G = "salt_100g"
        case saltUnit = "salt_unit"
        case saltValue = "salt_value"
        case novaGroup = "nova_group"
        case novaGroup100G = "nova_group_100g"
        case novaGroupServing = "nova_group_serving"
        case nutritionScoreFr = "nutrition_score_fr"
        case nutritionScoreFr100G = "nutrition_score_fr_100g"
        case cholesterol100G = "cholesterol_100g"
        case cholesterolServing = "cholesterol_serving"
        case cholesterolUnit = "cholesterol_unit"
        case cholesterolValue = "cholesterol_value"
        case calcium
        case calcium100G = "calcium_100g"
        case calciumServing = "calcium_serving"
        case calciumUnit = "calcium_unit"
        case calciumValue = "calcium_value"
        case iron
        case iron100G = "iron_100g"
        case ironServing = "iron_serving"
        case ironUnit = "iron_unit"
        case ironValue = "iron_value"
    }
}

//MARK: - Nutriscore
struct NutriYears: Codable {
    var twentyOne: TwentyOne?
    var twentyThree: TwentyThree?
    
    enum CodingKeys: String, CodingKey {
        case twentyOne = "2021"
        case twentyThree = "2023"
    }
}

struct TwentyOne: Codable {
    var data: TwentyOneData?
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct TwentyOneData: Codable {
}

struct TwentyThree: Codable {
    var data: TwentyThreeData?
}

struct TwentyThreeData: Codable {
    var components: NutriComponents?
    var negativePoints: Int?
    var negativePointsMax: Int?
    var positivePoints: Int?
    var positivePointsMax: Int?
    
    enum CodingKeys: String, CodingKey {
        case components
        case negativePoints = "negative_points"
        case negativePointsMax = "negative_points_max"
        case positivePoints = "positive_points"
        case positivePointsMax = "positive_points_max"
    }
}

struct NutriComponents: Codable {
    var negative: [Tive]?
    var positive: [Tive]?
}

struct Tive: Codable {
    var id: String?
    var points, pointsMax: Int?
    var unit: String?
    var value: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, points
        case pointsMax = "points_max"
        case unit, value
    }
}

