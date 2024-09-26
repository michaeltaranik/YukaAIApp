//
//  OnboardingView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedTab: Int = 0
    private let labels: [String] = [
        "Become Healthy with",
        "Scan your foods and get the",
        "Analyze your history and get"
    ]
    private let titles: [String] = [
        "Yuca: AI Scanner",
        "Nutriscore",
        "Better"
    ]
    private let descriptions: [String] = [
        "International science-based quality assessment standard",
        "Our AI scans your foods and provides a unique nutritional score",
        "See your entire experience through time and improve your quality of life"
    ]
    
    var body: some View {
        ZStack {
            Color.mossGreen.ignoresSafeArea()
            OnboardingTransitionView(selectedTab: $selectedTab)
            VStack {
                Spacer()
                OnboardingScreenView(
                    label: labels[selectedTab],
                    title: titles[selectedTab],
                    onContinue: {
                        HapticManager.shared.impact(style: .medium)
                        withAnimation(.smooth) {
                            selectedTab = (selectedTab + 1) % 3
                        }
                    },
                    desciprion: descriptions[selectedTab])
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    OnboardingView()
}

