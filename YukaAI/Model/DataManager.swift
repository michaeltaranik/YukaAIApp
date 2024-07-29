//
//  Data.swift
//  YukaAI
//
//  Created by Michael Taranik on 20.07.2024.
//

import Foundation
import SwiftUI



class DataManager: ObservableObject {
    
    
    @Published var results: Results?
    
    static let urlString = "https://world.openfoodfacts.org/api/v3/product/"
    static let searchString = "https://world.openfoodfacts.org/cgi/search.pl"
    
    private static let localUrlString = "https://9fa8-178-197-214-16.ngrok-free.app/product/"
    
    
    
    static func getDataResults(barcode: String) async throws -> Results {
        
        let urlString = urlString + barcode + ".json"
        guard let url = URL(string: urlString) else { throw UserError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Results.self, from: data)
        } catch {
            throw UserError.invalidData
        } 
    }
    
    
    
//    
//    static func getProductInfo(barcode: String) async throws -> ProductInfo {
//        
////        let urlString = urlString + barcode + ".json"
//        let urlString = localUrlString + barcode
//        print("DEBUG: "+urlString)
//        guard let url = URL(string: urlString) else { throw UserError.invalidURL }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        guard let response = response as? HTTPURLResponse,
//              response.statusCode == 200 else {
//            throw UserError.invalidResponse
//        }
//        
//        do {
//            let decoder = JSONDecoder()
////            let profuctInfo = try decoder.decode(ProductInfo.self, from: data)
////            print(profuctInfo)
////            return profuctInfo
//            let decoded = try decoder.decode(ProductInfo.self, from: data)
//            print("DEBUG: \(decoded)")
//            return decoded
//        } catch {
//            throw UserError.invalidData
//        }
//    }
    
    
    
    
//    func fetchData(barcode: String) {
//        if let url = URL(string: DataManager.urlString + barcode + ".json") {
//            print(url)
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let results = try decoder.decode(Results.self, from: safeData)
//                            DispatchQueue.main.async {
//                                self.results = results
//                                print(results)
//                                self.delegate?.didLoadResult(self, results: self.results!)
//                            }
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//    
    
}
