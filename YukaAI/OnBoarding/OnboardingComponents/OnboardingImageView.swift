//
//  OnboardingImageView.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.09.2024.
//

import SwiftUI

struct OnboardingImageView: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .overlay {
                LinearGradient(stops: [
                    .init(color: .clear, location: 0),
                    .init(color: .white.opacity(0), location: 0.1),
                    .init(color: .white.opacity(0), location: 0.9),
                    .init(color: .clear, location: 1)],
                               startPoint: .leading,
                               endPoint: .trailing)
            }
            .overlay {
                LinearGradient(stops: [
                    .init(color: .greenGradient2, location: 0),
                    .init(color: .white.opacity(0), location: 0.3)],
                               startPoint: .bottom,
                               endPoint: .top)
            }
    }
}

#Preview {
    OnboardingImageView(image: "paywallScreen")
}
