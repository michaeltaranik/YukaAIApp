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


struct ProductItem: Hashable {
    
//    let id = UUID().uuidString
    let name: String
    let calories: String
    let image: UIImage
    let macros: Macros
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name + calories)
    }
    
    static func == (lhs: ProductItem, rhs: ProductItem) -> Bool {
        return lhs.name == rhs.name
    }
}


struct Macros {
    let fat: String
    let carbs: String
    let protein: String
    let fiber: String
    let sugar: String
    let salt: String
}


