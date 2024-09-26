//
//  OnboardingView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowPaywall: Bool
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ZStack {
            Color.mossGreen.ignoresSafeArea()
            OnboardingTransitionView(selectedTab: $selectedTab)
            VStack {
                Spacer()
                OnboardingScreenView(
                    label: Onboarding.label(selectedTab).getText,
                    title: Onboarding.title(selectedTab).getText,
                    onContinue: {
                        HapticManager.shared.impact(style: .medium)
                        withAnimation(.smooth) {
                            if self.selectedTab == 2 {
                                self.shouldShowPaywall.toggle()
                                print(self.shouldShowPaywall.description)
                            } else {
                                self.selectedTab = (self.selectedTab + 1) % 3
                                print(self.shouldShowPaywall.description)
                            }
                        }
                    },
                    description: Onboarding.description(selectedTab).getText,
                    isAnimated: selectedTab == 2)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    OnboardingView(shouldShowPaywall: .constant(false))
}

