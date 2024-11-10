//
//  Data.swift
//  YukaAI
//
//  Created by Michael Taranik on 20.07.2024.
//

import Foundation
import SwiftUI

class DataManager {
    static let shared = DataManager(); private init() { }
    
    func fetchProductInfo<T: Codable> (from barcode: String) async throws -> T {
        //creating URL
        let url = URLManager.shared.createURL(for: .global, with: .productInfo(barcode: barcode))
        guard let url = url else { throw UserError.invalidURL }
        // getting data, response
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        // trying to decode
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch(let error) {
            print(error)
            print(error.localizedDescription)
            throw UserError.invalidData
        }
    }
    
    func fetchProductInfoLocal<T: Codable> (from barcode: String) async throws -> T {
        //creating URL
        let url = URLManager.shared.createURL(for: .local, with: .productInfo(barcode: barcode))
        guard let url = url else { throw UserError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("\(K.api.bearerToken)", forHTTPHeaderField: "Authorization")
        
        // getting data, response
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            print(response)
            throw UserError.invalidResponse
        }
        
        // trying to decode
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch(let error) {
            print(error)
            print(error.localizedDescription)
            print(String(data: data, encoding: .utf8)!)
            throw UserError.invalidData
        }
    }
    
    func postFeedback(image: ImageModel) {
        let url = URLManager.shared.createURL(for: .local, with: .imageAnalyzer)
        guard let url = url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
#warning("rectify")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // rectify
        
        do {
            let jsonData = try JSONEncoder().encode(image)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                    print(response ?? "No response")
                    return
                }
                
                
                print(response ?? "success")
            }
            .resume()
        } catch (let error){
            print(error)
        }
    }
    
    func computeNutritionScore(for food: Codable) -> Int {
        let range = 0...100
        
        return range.randomElement()!
        
    }
    
    
}
