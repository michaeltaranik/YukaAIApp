//
//  CornerIconView.swift
//  YukaAI
//
//  Created by Michael Taranik on 30.09.2024.
//

import SwiftUI

struct CornerIconView: View {
    
    let imageName: String
    var size: CGFloat = 40
    var cornerRadius: CGFloat = 10
    let onTap: () -> Void
    
    var body: some View {
        Image(systemName: imageName)
            .frame(width: size, height: size)
            .background(Color.theme.iconBackColor)
            .foregroundStyle(.white)
            .cornerRadius(cornerRadius)
            .onTapGesture { HapticManager.shared.impact(style: .medium); onTap() }
    }
}

#Preview {
    ZStack {
//        Image(.screen3AI)
        Color.black.ignoresSafeArea()
        CornerIconView(imageName: "person") {
            
        }
    }
}
