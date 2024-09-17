//
//  OnboardingView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        ZStack {
            OnboardingTabView()
            VStack {
                Spacer()
                OnboardingScreenView(
                    label: "Become Healthy with",
                    title: "Yuca: Ai Scanner",
                    onContinue: {

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

