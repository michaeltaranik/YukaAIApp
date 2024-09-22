//
//  OnboardingView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ZStack {
            Color.mossGreen.ignoresSafeArea()
            OnboardingTabView(selectedTab: $selectedTab)
            VStack {
                Spacer()
                OnboardingScreenView(
                    label: "Become Healthy with",
                    title: "Yuca: Ai Scanner",
                    onContinue: {
                        HapticManager.shared.impact(style: .medium)
                        withAnimation(.smooth) {
                            selectedTab = (selectedTab + 1) % 3
                        }
                    },
                    desciprion: "Get started with Yuka Ai")
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    OnboardingView()
}

