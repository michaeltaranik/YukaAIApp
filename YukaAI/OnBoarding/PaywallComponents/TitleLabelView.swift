//
//  TitleLabelView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.09.2024.
//

import SwiftUI

struct TitleLabelView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
          VStack(spacing: 8) {
            HStack(spacing: 10) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 298, height: 250)
                .blendMode(.overlay)
              Text("Unlock the Assistant")
                .font(Font.custom("SF Pro Display", size: 24).weight(.semibold))
                .tracking(0.30)
                .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(
              LinearGradient(gradient: Gradient(colors: [Color(red: 0.51, green: 0.63, blue: 0.47).opacity(0.75), Color(red: 0.44, green: 0.77, blue: 0.96)]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(16)
          }
          .frame(maxWidth: .infinity, minHeight: 45, maxHeight: 45)
        }
        .padding(EdgeInsets(top: 16, leading: 6, bottom: 16, trailing: 6))
        .frame(width: 311, height: 77)
    }
}

#Preview {
    ZStack {
        Color.greenGradient2.ignoresSafeArea()
        TitleLabelView()
    }
        
}
