//
//  ProductItem.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.07.2024.
//

import Foundation
import SwiftUI


//class ProductList: ObservableObject {
//    @Published var list: [ProductItem] = [ProductItem]()
//}


struct ProductItem: Hashable, Identifiable, Codable {
    
    var id = UUID()
    
    var barcode: String
    var imageUrl: String
    var name: String
    
//    var calories: String
//    var macros: Macros
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(barcode + imageUrl)
    }
    
    static func == (lhs: ProductItem, rhs: ProductItem) -> Bool {
        return lhs.id == rhs.id
    }
}




struct Macros: Codable {
    
    init(_ fat: String, _ carbs: String, _ protein: String, _ fiber: String, _ sugar: String, _ salt: String) {
        self.fat = fat
        self.carbs = carbs
        self.protein = protein
        self.fiber = fiber
        self.sugar = sugar
        self.salt = salt
    }
    
    
    let fat: String
    let carbs: String
    let protein: String
    let fiber: String
    let sugar: String
    let salt: String
}


