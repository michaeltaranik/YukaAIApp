//
//  ImageShower.swift
//  YukaAI
//
//  Created by Michael Taranik on 19.07.2024.
//

import Foundation
import SwiftUI

class ImageLoader {
    
    static let urlString = "https://picsum.photos/200"
    
    let hui: String? = nil
    
    static func fetchImage() -> some View {
        return AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Color.gray
                    StatsView()
                }
            case .success(let image):
                image.resizable()
            case .failure(let error):
                Text(error.localizedDescription)
            @unknown default:
                EmptyView()
            }
        }
            .frame(width: 200, height: 200)
    }
}
