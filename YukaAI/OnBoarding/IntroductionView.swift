//
//  IntroductionView.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.09.2024.
//

import SwiftUI

struct IntroductionView: View {
    @State private var showPaywall = false
    var body: some View {
        if showPaywall {
            PaywallView()
        } else {
            OnboardingView(shouldShowPaywall: $showPaywall)
        }
    }
}

#Preview {
    IntroductionView()
}
