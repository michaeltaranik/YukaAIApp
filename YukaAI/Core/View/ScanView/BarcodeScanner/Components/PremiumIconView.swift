//
//  PremiumIconView.swift
//  YukaAI
//
//  Created by Michael Taranik on 30.09.2024.
//

import SwiftUI

struct PremiumIconView: View {
    
    @State var isAnimating: Bool = false
    
    var cornRad: CGFloat = 12
    var width: CGFloat = 100
    var height: CGFloat = 35
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornRad)
                .frame(width: width, height: height)
            AnimatedBackgroundView(animateGradient: $isAnimating, duration: 2)
                .clipShape(RoundedRectangle(cornerRadius: cornRad))
                .frame(width: width, height: height)
                .mask {
                    HStack (spacing: 0) {
                        Image(systemName: "crown")
                        Text("PRO")
                    }
                    .font(.system(size: height / 1.75, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .bold()
                }
        }
    }
}

#Preview {
    PremiumIconView()
}
