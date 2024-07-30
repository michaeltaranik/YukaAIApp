//
//  ScanView-ViewModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 30.07.2024.
//

import Foundation
import SwiftUI


extension ScanView {
    
    @MainActor
    class ViewModel: ObservableObject {
        
        @Published var isLoading = false
        @Published var productName = "Product"
        @Published var calories = "0.0"
        @Published var carbs = "0.0"
        @Published var fats = "0.0"
        @Published var proteins = "0.0"
        @Published var sugars = "0.0"
        @Published var nutriScore = 69
        @Published var results: Results?
        @Published var userError: UserError?
        @Published var shouldShowAlert = false
        @Published var imageUrlString: String = ""
        @Published var quality: ProductQuality = .average(color: .yellow)
            
        
        
        
        func getInfo(barcode: String) async {
            isLoading = true
            do {
                self.results = try await DataManager.getDataResults(barcode: barcode)
                self.isLoading = false
            } catch(let error) {
                userError = UserError.custom(error: error)
                shouldShowAlert = true
                isLoading = false
            }
        }
        
        
        
        func changeMacros() {
            self.productName = results?.product?.productName ?? "Unknown"
            let roundedCal = ((results?.product?.nutriments.energy_value ?? 0.0) / 4.184).rounded()
            self.calories = String(roundedCal)
            self.carbs = String(results?.product?.nutriments.carbohydrates_100g ?? 0.0)
            self.proteins = String(results?.product?.nutriments.proteins_100g ?? 0.0)
            self.fats = String(results?.product?.nutriments.fat_100g ?? 0.0)
            self.sugars = String(results?.product?.nutriments.sugars_100g ?? 0.0)
            self.imageUrlString = results?.product?.imageUrl ?? ""
            self.nutriScore = results?.product?.ecoscoreData?.score ?? -1
            guard nutriScore != -1 else { return }
            switch nutriScore {
            case 70...100:
                self.quality = .good(color: .lightGreen)
            case 0...30:
                self.quality = .bad(color: .lightRed)
            default:
                self.quality = .average(color: .lightRed)
            }
        }
        
        func inCart(_ barcode: String, productList: ProductList) -> Bool {
            for product in productList.list {
                if product.barcode == barcode {
                    return true
                }
            }
            return false
        }
        
        func addToCart(_ barcode: String, productList: ProductList, imageUrl: String?) {
            guard !self.inCart(barcode, productList: productList) else { return }
            guard self.productName != "Unknown" else {
                shouldShowAlert = true
                return }
            productList.list.append(
                ProductItem(barcode: barcode,
                            name: self.productName,
                            calories: self.calories,
                            imageUrl: imageUrl ?? "",
                            macros: Macros(fat: self.fats,
                                           carbs: self.carbs,
                                           protein: self.proteins,
                                           fiber: "nil", sugar: self.sugars, salt: "nil")))
        }
        
        
    }
    
}
