//
//  ScanView-ViewModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 30.07.2024.
//

import Foundation
import SwiftUI

extension ProductItemView {
    @MainActor
    class ViewModel: ObservableObject {
        private var publicResults: GlobalResults?
        private var privateHostResults: LocalResults?
        private var userError: UserError?
        
        @Published var productItem: ProductItem?
        @Published var isLoading = false
        @Published var shouldShowAlert = false
        
        private func createProductItem(with results: GlobalResults) {
            self.productItem = ProductItem(results: results)
        }
        
        private func createProductItem(with results: LocalResults) {
            self.productItem = ProductItem(results: results)
        }
        
        func getInfo(barcode: String, isLocal: Bool) async {
            isLoading = true
            do {
                if (isLocal) {
                    self.privateHostResults = try await DataManager.shared.fetchProductInfoLocal(from: barcode)
                } else {
                    self.publicResults = try await DataManager.shared.fetchProductInfo(from: barcode)
                }
                
                self.isLoading = false
                if let results = privateHostResults {
                    createProductItem(with: results)
                }
                if let results = publicResults {
                    createProductItem(with: results)
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
    }
}
