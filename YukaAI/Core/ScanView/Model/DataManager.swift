//
//  Data.swift
//  YukaAI
//
//  Created by Michael Taranik on 20.07.2024.
//

import Foundation
import SwiftUI



class DataManager: ObservableObject {
    
        
    static let baseUrlString = "https://world.openfoodfacts.org/api/v3/product/"
    static let searchString = "https://world.openfoodfacts.org/cgi/search.pl"
    
    private static let localUrlString = "https://9fa8-178-197-214-16.ngrok-free.app/product/"
    
    
    
    static func getDataResults(barcode: String) async throws -> Results {
                
        let URLstring = baseUrlString + "3045140105502" + ".json"
        print(URLstring)
        guard let url = URL(string: URLstring) else { throw UserError.invalidURL }
        
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
    
    
    
}
