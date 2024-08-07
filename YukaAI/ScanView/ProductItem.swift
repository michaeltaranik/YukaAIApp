//
//  ProductItem.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.07.2024.
//

import Foundation
import SwiftUI


class ProductList: ObservableObject {
    @Published var list: [ProductItem] = [ProductItem]()
}


struct ProductItem: Hashable, Identifiable, Codable {
    
    var id = UUID()
    
    var barcode: String
    var name: String
    var calories: String
    var imageUrl: String
    var macros: Macros
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name + calories)
    }
    
    static func == (lhs: ProductItem, rhs: ProductItem) -> Bool {
        return lhs.name == rhs.name
    }
}




struct Macros: Codable {
    let fat: String
    let carbs: String
    let protein: String
    let fiber: String
    let sugar: String
    let salt: String
}


