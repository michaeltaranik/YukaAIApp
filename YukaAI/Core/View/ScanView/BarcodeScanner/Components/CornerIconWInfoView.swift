//
//  CornerIconWInfoView.swift
//  YukaAI
//
//  Created by Michael Taranik on 30.09.2024.
//

import SwiftUI

struct CornerIconWInfoView: View {
    
    let imageName: String
    let info: String
    var size: CGFloat = 40
    var cornerRadius: CGFloat = 10
    let onTap: () -> Void
    
    var infoColor: Color = .greenGradient2
    
    private var cornerIconSize: CGFloat {
        size * 0.625
    }
    
    var body: some View {
        ZStack {
            
            CornerIconView(imageName: imageName, size: size, cornerRadius: cornerRadius, onTap: onTap)
            
            ZStack {
                Circle()
                    .frame(width: cornerIconSize, height: cornerIconSize)
                    .foregroundColor(infoColor)
                
                Text(info)
                    .foregroundColor(.white)
                    .font(.system(size: size / 2.2, weight: .bold, design: .rounded))
            }
            .offset(x: size / 2, y: -size / 2)
        }
    }
}

#Preview {
    CornerIconWInfoView(imageName: "cart", info: "5", onTap: {})
}
