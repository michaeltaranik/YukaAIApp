//
//  HintView.swift
//  YukaAI
//
//  Created by Michael Taranik on 01.10.2024.
//

import SwiftUI

struct HintView: View {
    
    var width: CGFloat = 160
    var height: CGFloat = 36
    var cornerRadius: CGFloat = 10
    
    var body: some View {
        VStack(spacing: 0) {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.theme.iconBackColor)
                .frame(width: width, height: height)
                .overlay {
                    HStack(spacing: 5) {
                        Image(systemName: "info.circle")
                        Text("Take photo of a cart")
                    }
                    .font(.system(size: height / 3, weight: .bold, design: .default))
                    .foregroundColor(.white)
                }
            
            Rectangle()
                .trim(from: 0.5, to: 1)
                .fill(Color.theme.iconBackColor)
                .rotationEffect(.degrees(-45))
                .frame(width: height / 3, height: height / 3)
                .scaleEffect(x: 2, y: 1, anchor: .center)
                .offset(x: 0, y: -height / 6)
            
        }
    }
}

#Preview {
    HintView()
        .scaleEffect(2.5)
}
