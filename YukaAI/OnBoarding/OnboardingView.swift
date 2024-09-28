//
//  OnboardingView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var shouldShowPaywall: Bool
    @State private var selectedTab = 0
    
    private var isLastTab: Bool { selectedTab == 2 }
    
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
                        HapticManager.shared.impact(style: isLastTab ? .heavy : .medium)
                        
                        withAnimation(.smooth) {
                            if isLastTab {
                                shouldShowPaywall.toggle()
                            } else {
                                selectedTab = (selectedTab + 1) % 3
                            }
                        }
                    },
                    description: Onboarding.description(selectedTab).getText,
                    isAnimated: isLastTab
                )
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    OnboardingView(shouldShowPaywall: .constant(false))
}

