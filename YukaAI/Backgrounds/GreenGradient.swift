//
//  MeshGradientOverview.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.07.2024.
//

import SwiftUI

struct GreenGradient: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            if #available(iOS 18.0, *) {
                MeshGradient(width: 3, height: 3, points: [
                    [0.0, 0.0], [0.5, 0], [1.0, 0.0],
                    [0.0, 0.5], [isAnimating ? 0.1 : 0.9, 0.5], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                ],
                             colors: [
                                Color(hue: 0.33, saturation: 0.8, brightness: 1.0), // Bright Green
                                Color(hue: 0.33, saturation: 0.7, brightness: 0.9), // Slightly less bright Green
                                Color(hue: 0.33, saturation: 0.6, brightness: 1.0), // Bright Green
                                Color(hue: 0.33, saturation: 0.9, brightness: 0.8), // Bright Green
                                isAnimating
                                ? Color(hue: 0.33, saturation: 0.5, brightness: 1.0)
                                : Color(hue: 0.33, saturation: 0.4, brightness: 0.9), //  Toggle between bright greens
                                Color(hue: 0.33, saturation: 0.6, brightness: 1.0), // Bright Green
                                Color(hue: 0.33, saturation: 0.5, brightness: 0.9), // Bright Green
                                Color(hue: 0.33, saturation: 0.7, brightness: 0.9), // Bright Green
                                Color(hue: 0.33, saturation: 0.6, brightness: 1.0) // Bright Green
                             ],
//                             colors: [
//                    .red, .purple, .indigo,
//                    .orange, isAnimating ? .white : .brown, .blue,
//                    .yellow, .green, .mint
//                ],
//                             colors: [
//                                         .green, Color(hue: 0.33, saturation: 0.8, brightness: 0.7), Color(hue: 0.33, saturation: 0.7, brightness: 0.8),
//                                         Color(hue: 0.33, saturation: 0.9, brightness: 0.6), isAnimating ? Color(hue: 0.33, saturation: 0.5, brightness: 1.0) : Color(hue: 0.33, saturation: 0.4, brightness: 0.5), Color(hue: 0.33, saturation: 0.6, brightness: 0.9),
//                                         Color(hue: 0.33, saturation: 0.5, brightness: 0.8), Color(hue: 0.33, saturation: 0.7, brightness: 0.6), Color(hue: 0.33, saturation: 0.6, brightness: 0.7)
//                                     ],
                             
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
//    MeshGradientOverview()
//}
