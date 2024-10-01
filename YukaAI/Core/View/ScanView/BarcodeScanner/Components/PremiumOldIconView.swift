//
//  PremiumOldIconView.swift
//  YukaAI
//
//  Created by Michael Taranik on 01.10.2024.
//

import SwiftUI

struct PremiumOldIconView: View {
    
//    @State var isAnimating: Bool = false
    
    var cornRad: CGFloat = 13
    var width: CGFloat = 95
    var height: CGFloat = 35

    let color = LinearGradient(
        colors: [.greenGradient1, .greenGradient2],
        startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornRad)
                .fill(color.opacity(1))
                .frame(width: width, height: height)
                .padding(1)
                .background(.seaFoamGreen)
                .cornerRadius(cornRad)
            HStack(spacing: 0) {
                Image(systemName: "crown")
                Text("PRO")
            }
            .font(.system(size: height / 1.75, weight: .bold, design: .rounded))
            .foregroundStyle(.white)
            .bold()
        }
    }
}

#Preview {
    PremiumOldIconView()
        .scaleEffect(4)
}
