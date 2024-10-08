//
//  OnboardingView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var isOnboardingComplete: Bool
    @State private var selectedTab = 0
    
    private var isLastTab: Bool { selectedTab == 2 }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mossGreen.ignoresSafeArea()
                
                OnboardingTransitionView(selectedTab: $selectedTab)
                
                VStack {
                    Color.gradients.blackFade
                    
                    Spacer()
                    
                    panel
                }
            }
            .edgesIgnoringSafeArea(.top)
            .toolbar { turnbackButton }
        }
    }
}

#Preview {
    OnboardingView(isOnboardingComplete: .constant(false))
}

extension OnboardingView {
    var panel: some View {
        OnboardingPanelView(
            label: Onboarding.label(selectedTab).getText,
            title: Onboarding.title(selectedTab).getText,
            onContinue: {
                HapticManager.shared.impact(style: isLastTab ? .heavy : .medium)
                
                withAnimation(.smooth) {
                    if isLastTab {
                        isOnboardingComplete = true
                    } else {
                        selectedTab = (selectedTab + 1) % 3
                    }
                }
            },
            description: Onboarding.description(selectedTab).getText,
            withGradient: isLastTab
        )
        .padding(.bottom, 30)
    }
    
    var turnbackButton: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                if selectedTab > 0 {
                    HapticManager.shared.impact(style: .medium)
                    withAnimation {
                        selectedTab -= 1
                    }
                }
            } label: {
                Image(systemName: "chevron.backward")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding(.trailing)
                    .opacity(selectedTab == 0 ? 0 : 1)
            }
        }
    }
}
