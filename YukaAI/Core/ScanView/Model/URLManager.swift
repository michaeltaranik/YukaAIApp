//
//  URLManager.swift
//  YukaAI
//
//  Created by Michael Taranik on 14.08.2024.
//

import Foundation



struct URLManager {
    static let shared = URLManager(); private init() { }
    
    private let tunnel = "https://"
    
    func createURL(for server: APIServer, with endpoint: APIEndpoint) -> URL? {
        let urlString = tunnel + server.rawValue + endpoint.path
        let url = URL(string: urlString)
        return url
    }
}






enum APIEndpoint {
    case imageAnalyzer
    case productInfo(barcode: String)
    
    var path: String {
        switch self {
        case .imageAnalyzer:
            return "/image/analyze"
        case .productInfo(let barcode):
            return "/product/\(barcode)"
        }
    }
}
