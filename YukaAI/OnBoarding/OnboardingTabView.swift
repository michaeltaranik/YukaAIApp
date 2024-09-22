//
//  OnboardingTabView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var selectedTab: Int
    @State private var offset: CGSize = .zero
    private let images: [String] = ["screen1", "screen2", "screen3"]
    private var totalPages: Int { images.count }
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<totalPages, id: \.self) { indx in
                ZStack {
                    VStack(spacing: 0) {
                        Image(images[indx])
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
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [.mossGreen, .greenGradient2],
                                               startPoint: .bottom,
                                               endPoint: .top)
                            )
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .ignoresSafeArea()
                    
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .ignoresSafeArea()
        .onChange(of: selectedTab) { newValue in
            if newValue < 0 {
                selectedTab = 0
            } else if newValue >= totalPages {
                selectedTab = totalPages - 1
            }
        }
    }
}

#Preview {
    OnboardingTabView(selectedTab: .constant(1))
}
