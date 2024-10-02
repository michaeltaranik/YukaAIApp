//
//  BarcodeFrameView.swift
//  YukaAI
//
//  Created by Michael Taranik on 02.10.2024.
//

import SwiftUI

struct BarcodeFrameView<U: View, L: View>: View {
    
    var upperFrameContent: U
    var lowerFrameContent: L
    
    var textLabel: String = "Scan"
    var textSize: CGFloat = 24
    var paddingHorizontal: CGFloat = 20
    var paddingTop: CGFloat = 20
    var paddingBottom: CGFloat = 20
    var gradientHeight: CGFloat = 200
    
    private var upperGradient: LinearGradient {
        LinearGradient(
            colors: Color.gradients.gradientBlackColors,
            startPoint: .top, endPoint: .bottom)
    }
    private var lowerGradient: LinearGradient {
        LinearGradient(
            colors: Color.gradients.gradientBlackColors,
            startPoint: .bottom, endPoint: .top)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(upperGradient.opacity(0.9))
                    .frame(height: gradientHeight)
                Spacer()
                Rectangle()
                    .fill(lowerGradient.opacity(0.9))
                    .frame(height: gradientHeight)
            }
            .ignoresSafeArea()
            
            VStack {
                upperFrameContent
                    .overlay {
                        Text(textLabel)
                            .foregroundColor(.white)
                            .font(.system(size: textSize, weight: .bold, design: .rounded))
                            .padding()
                    }
                    .padding(.top, paddingTop)
                    .padding(.horizontal, paddingHorizontal)
                
                Spacer()
                
                lowerFrameContent
                    .padding(.bottom, paddingBottom)
                    .padding(.horizontal, paddingHorizontal)
            }
        }
    }
}

#Preview {
    BarcodeFrameView(
        upperFrameContent: HStack {
            PremiumIconView()
            Spacer()
            CornerIconView(imageName: "list.bullet.clipboard", onTap: { })
        },
        lowerFrameContent: TakePhotoButtonView(onTap: { })
    )
}
