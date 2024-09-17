//
//  OnboardingTabView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingTabView: View {
    @State private var selectedTab: Int = 0
    private let images: [String] = ["screen3", "screen2", "screen1"]
    var body: some View {
        TabView {
            ForEach(0..<3) { indx in
                ZStack {
                    VStack {
                        Image(images[indx])
                            .resizable()
                            .scaledToFit()
                        Spacer()
                    }
                    .ignoresSafeArea()
                    VStack {
                        LinearGradient(
                            colors: [.mossGreen, .greenGradient2, .white.opacity(0)],
                            startPoint: .bottom,
                            endPoint: .top)
                    }
                    .ignoresSafeArea()
                }
            }
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingTabView()
}
