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
    @Published var image: UIImage?
    @Published var userError: UserError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
        
    func getInfo(barcode: String) async {
        isLoading = true
        do {
            self.results = try await DataManager.getDataResults(barcode: barcode)
//            guard let urlString = results?.product?.image_url else { return }
//            if let url = URL(string: urlString) {
//                if let safeData = try? Data(contentsOf: url) {
//                    let newImage = UIImage(data: safeData)
//                    self.image = newImage
//                }
//            }
            self.isLoading = false
        } catch(let error) {
            userError = UserError.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
    
//    func getImage(url: String) async {
//        isLoading = true
//        do {
//            self.isLoading = false
//        } catch(let error) {
//            userError = UserError.custom(error: error)
//            shouldShowAlert = true
//            isLoading = false
//        }
//    }
}
