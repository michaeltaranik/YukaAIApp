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
//        private var results: GlobalResults?
        private var localResults: LocalResults?
        private var userError: UserError?
        
        @Published var productItem: ProductItem?
        @Published var isLoading = false
        @Published var shouldShowAlert = false
        
        private func createProductItem(results: GlobalResults) {
            self.productItem = ProductItem(results: results)
        }
        
        private func createProductItem(with results: LocalResults) {
            self.productItem = ProductItem(results: results)
        }
        
        func getInfo(barcode: String) async {
            isLoading = true
            do {
                self.localResults = try await DataManager.shared.fetchProductInfoLocal(from: barcode)
                self.isLoading = false
                if let results = localResults {
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
