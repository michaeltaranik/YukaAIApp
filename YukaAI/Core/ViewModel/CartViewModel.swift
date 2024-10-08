//
//  CartViewModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 07.08.2024.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published private(set) var products: [ProductItem] = []
    
    init() { loadCart() }
    
    func loadCart() {
        do {
            let data = try Data(contentsOf: K.file.saveToCartPath)
            products = try JSONDecoder().decode([ProductItem].self, from: data)
        } catch {
            products = []
        }
    }
    
    func saveToCart(product: ProductItem) {
        addNewProductItem(product)
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: K.file.saveToCartPath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    private func addNewProductItem(_ product: ProductItem) {
        guard !self.isInCart(product.barcode) else { return }
        products = products.reversed()
        products.append(product)
        products = products.reversed()
    }
    
    func isInCart(_ barcode: String) -> Bool {
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
            try data.write(to: K.file.saveToCartPath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
    
    

