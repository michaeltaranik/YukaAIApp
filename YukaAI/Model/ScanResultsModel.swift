//
//  ScanResultsModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 25.07.2024.
//

import Foundation
import SwiftUI


@MainActor
final class ScanResultsModel: ObservableObject {
    
    @Published var results: Results?
//    @Published var productInfo: ProductInfo?
    @Published var image: UIImage?
    @Published var userError: UserError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
        
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
    
    
//
//    func getProductInfo(_ barcode: String) async {
//        isLoading = true
//        do {
//            self.productInfo = try await DataManager.getProductInfo(barcode: barcode)
//            print("DEBUG: ")
//            print(productInfo ?? "")
//            self.isLoading = false
//        } catch(let error) {
//            userError = UserError.custom(error: error)
//            shouldShowAlert = true
//            isLoading = false
//        }
//    }
    
    
    
}
