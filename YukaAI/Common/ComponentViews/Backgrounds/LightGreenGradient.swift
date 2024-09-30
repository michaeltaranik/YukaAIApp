//
//  LightGreenGradient.swift
//  YukaAI
//
//  Created by Michael Taranik on 30.07.2024.
//

import SwiftUI

struct LightGreenGradient: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            if #available(iOS 18.0, *) {
                MeshGradient(width: 3, height: 3, points: [
                    [0.0, 0.0], [0.5, 0], [1.0, 0.0],
                    [0.0, 0.5], [isAnimating ? 0.1 : 0.9, 0.5], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                ], colors: [
                    Color(hue: 0.33, saturation: 0.2, brightness: 1.0), // Very Light Green
                    Color(hue: 0.33, saturation: 0.15, brightness: 0.95), // Slightly less bright light green
                    Color(hue: 0.33, saturation: 0.1, brightness: 1.0), // Very Light Green
                    Color(hue: 0.33, saturation: 0.25, brightness: 0.9), // Light Green
                    isAnimating
                    ? Color(hue: 0.33, saturation: 0.05, brightness: 1.0)
                    : Color(hue: 0.33, saturation: 0.1, brightness: 0.95), // Toggle between very light greens
                    Color(hue: 0.33, saturation: 0.2, brightness: 1.0), // Very Light Green
                    Color(hue: 0.33, saturation: 0.1, brightness: 0.9), // Light Green
                    Color(hue: 0.33, saturation: 0.15, brightness: 0.95), // Light Green
                    Color(hue: 0.33, saturation: 0.2, brightness: 1.0) // Very Light Green
                ],
                             smoothsColors: true,
                             colorSpace: .perceptual
                )
                .onAppear {
                    withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                        isAnimating.toggle()
                    }
                }
            } else {
                Color(.lightGreen)
                    .ignoresSafeArea()
            }
            
            
            
        }
        .ignoresSafeArea()
        
    }
}
//
//#Preview {
//    LightGreenGradient()
//}
