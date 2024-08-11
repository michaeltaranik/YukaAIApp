//
//  CartViewModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 07.08.2024.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published private(set) var products: [ProductItem] = []
    @Published var isEditing: Bool = false
    
    init() {
        loadCart()
    }
    
    
    
    func loadCart() {
        do {
            let data = try Data(contentsOf: K.saveToCartPath)
            products = try JSONDecoder().decode([ProductItem].self, from: data)
        } catch {
            products = []
        }
    }
    
    
    
    func saveToCart(_ barcode: String, imageUrlString: String, productName: String, nutriscore: Int) {
        addNewProductItem(barcode, imageUrlString, productName, nutriscore)
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: K.saveToCartPath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
    
    private func addNewProductItem(_ barcode: String, _ imageUrlString: String, _ productName: String, _ score: Int) {
        guard !self.inCart(barcode) else { return }
        products = products.reversed()
        products.append(ProductItem(barcode: barcode, imageUrl: imageUrlString, name: productName, nutriscore: score))
        products = products.reversed()
    }
    
    
    func inCart(_ barcode: String) -> Bool {
        for product in products {
            if product.barcode == barcode {
                return true
            }
        }
        return false
    }
    
    
    
    func deleteFromCart(at indexSet: IndexSet) {
        products.remove(atOffsets: indexSet)
        HapticManager.shared.notification(type: .warning)
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: K.saveToCartPath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
}
    
    

