//
//  CartViewModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 07.08.2024.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published private(set) var products: [ProductItem] = []

    
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
    
    
    
    func saveToCart(_ barcode: String, imageUrlString: String, productName: String) {
        addNewProductItem(barcode, imageUrlString, productName)
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: K.saveToCartPath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
    
    private func addNewProductItem(_ barcode: String, _ imageUrlString: String, _ productName: String) {
        guard !self.inCart(barcode) else { return }
        products.append(ProductItem(barcode: barcode, imageUrl: imageUrlString, name: productName))
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
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: K.saveToCartPath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
}
    
    

