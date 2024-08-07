//
//  CartViewModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 07.08.2024.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published private(set) var products: [ProductItem] = []

    
    
    
    func loadCart() {
        do {
            let data = try Data(contentsOf: K.saveToCartPath)
            products = try JSONDecoder().decode([ProductItem].self, from: data)
            print(products)
        } catch {
            products = []
        }
    }
    
    
}
