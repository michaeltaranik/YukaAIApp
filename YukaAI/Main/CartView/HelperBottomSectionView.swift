//
//  WhatToCookView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.08.2024.
//

import SwiftUI

struct HelperBottomSectionView: View {
    
    let headline: String
    let subheadline: String = "Get an answer based on your cart"
    let image: Image
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .padding()
                .frame(height: 160)
                .foregroundColor(.lightGreen)
            HStack {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                    .cornerRadius(15)
                    .padding(.all, 25)
                VStack {
                    Text(headline)
                        .font(.system(.title, design: .rounded))
                    Text(subheadline)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                .padding()
                .padding(.trailing, 20)
            }
        }
    }
}

#Preview {
    HelperBottomSectionView(headline: "What can I cook?", image: Image(.fancyMeal))
}
