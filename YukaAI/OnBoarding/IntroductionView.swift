//
//  IntroductionView.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.09.2024.
//

import SwiftUI

struct IntroductionView: View {
    @State var shouldShowPaywall = false
    var body: some View {
        if shouldShowPaywall {
            PaywallView()
        } else {
            OnboardingView(shouldShowPaywall: $shouldShowPaywall)
        }
    }
}

#Preview {
    IntroductionView()
}
