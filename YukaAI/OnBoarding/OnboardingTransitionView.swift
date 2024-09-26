//
//  OnboardingTransitionView.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.09.2024.
//

import SwiftUI

struct OnboardingTransitionView: View {
    @Binding var selectedTab: Int
    private let images: [String] = ["screen1", "screen2", "screen3"]
    private var totalPages: Int { images.count }
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(images[selectedTab])
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
                    .overlay {
                        VStack {
                            Spacer()
                            circles
                        }
                    }
            }
            .ignoresSafeArea()
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded({ value in
                if value.translation.width > 0 {
                    withAnimation(.easeInOut){
                        selectedTab = selectedTab == 0 ? totalPages - 1 : selectedTab - 1
                    }
                }
                if value.translation.width < 0 {
                    withAnimation(.easeInOut){
                        selectedTab = (selectedTab + 1) % totalPages
                    }
                }
                if value.translation.height < 0 {
                }
                
                if value.translation.height > 0 {
                }
            }))
    }
}

#Preview {
    OnboardingTransitionView(selectedTab: .constant(0))
}



extension OnboardingTransitionView {
    var circles: some View {
        HStack {
            Circle()
                .opacity(selectedTab == 0 ? 1 : 0.3)
            Circle()
                .opacity(selectedTab == 1 ? 1 : 0.3)
            Circle()
                .opacity(selectedTab == 2 ? 1 : 0.3)
        }
        .frame(width: 45)
        .foregroundStyle(.white)
        .padding()
    }
}
