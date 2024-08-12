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
        
        private var results: Results?
        private var userError: UserError?
        
        
        @Published var productItem: ProductItem?
        @Published var isLoading = false
        @Published var shouldShowAlert = false
        
                
        
        func getInfo(barcode: String) async {
            isLoading = true
            do {
                self.results = try await DataManager.getDataResults(from: barcode)
                self.isLoading = false
                if let results = results {
                    createProductItem(results: results)
                }
                HapticManager.shared.notification(type: .success)
            } catch(let error) {
                print(error)
                userError = UserError.custom(error: error)
                shouldShowAlert = true
                isLoading = false
                HapticManager.shared.notification(type: .error)
            }
        }
        
        private func createProductItem(results: Results) {
            let nutriscore = DataManager.computeNutritionScore(for: results)
            self.productItem = ProductItem(results: results, score: nutriscore)
        }

        
    }
    
    
    
    
    
    
    
}
