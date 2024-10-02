//
//  PremiumIconView.swift
//  YukaAI
//
//  Created by Michael Taranik on 30.09.2024.
//

import SwiftUI

struct PremiumIconView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var isAnimating: Bool = false
    
    var cornRad: CGFloat = 12
    var width: CGFloat = 100
    var height: CGFloat = 35
    var gradientColors: [Color] = [
        .seaFoamGreen,
        .greenGradient1,
        .greenish,
        .greenGradient2,
        .seaFoamGreen]
    var lineWidth: CGFloat = 3
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornRad)
                .fill(Material.ultraThin)
//                .fill(colorScheme == .light ? .white : .black)
                .frame(width: width, height: height)
                .background {
                    RoundedRectangle(cornerRadius: cornRad)
                        .stroke(.seaFoamGreen, lineWidth: lineWidth)
                }
            AnimatedBackgroundView(
                animateGradient: $isAnimating,
                duration: 2,
                gradientColors: gradientColors,
                autoReverse: false)
            .clipShape(RoundedRectangle(cornerRadius: cornRad))
            .frame(width: width, height: height)
            .mask {
                HStack (spacing: 0) {
                    Image(systemName: "crown")
                    Text("PRO")
                }
                .font(.system(size: height / 1.7, weight: .bold, design: .default))
                .bold()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.accent.ignoresSafeArea()
        PremiumIconView()
            .scaleEffect(3)
    }
}
