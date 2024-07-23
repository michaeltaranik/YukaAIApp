//
//  Data.swift
//  YukaAI
//
//  Created by Michael Taranik on 20.07.2024.
//

import Foundation
import SwiftUI


protocol DataManagerDelegate {
    func didLoadResult(_ dataManager: DataManager, results: Results)
}


class DataManager: ObservableObject {
    
    
    @Published var results: Results?
    
    let urlString = "https://world.openfoodfacts.org/api/v3/product/"
    let searchString = "https://world.openfoodfacts.org/cgi/search.pl"
    
    var delegate: DataManagerDelegate?
    
    func fetchData(barcode: String) {
        if let url = URL(string: urlString + barcode + ".json") {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.results = results
                                print(results)
                                self.delegate?.didLoadResult(self, results: self.results!)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    
}