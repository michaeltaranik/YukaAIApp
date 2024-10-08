//
//  OnboardingScreenView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingPanelView: View {
    
    @State private var animated: Bool = false
    
    let label: String
    let title: String
    let onContinue: () -> Void
    let description: String
    var withGradient: Bool = false
    
    private let gradientDarkColors: [Color] = [.mossGreen, .cloverGreen]
    private let gradientLightColors: [Color] = [.mossGreen, .seaFoamGreen]
    private let mossGreenColors: [Color] = [.mossGreenLighter, .mossGreenLight]

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Text(label)
                    .fontWeight(.semibold)
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                
                SubscriptionHeaderView(title: title, description: description)
                    .padding(.bottom, 30)
                
                Button {
                    onContinue()
                } label: {
                    Text(withGradient ? "Start Scanning" : "Continue")
//                        .font(.headline)
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                        .padding(5)
                        .background {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.white)
                                .padding(7)
                                .shadow(radius: withGradient ? 0 : 10)
                                .background {
                                    if withGradient {
                                        AnimatedBackgroundView(
                                            animateGradient: $animated,
                                            duration: 3,
                                            gradientColors: [.greenGradient1, .mossGreen, .green, .greenGradient1],
                                            autoReverse: false)
                                            .cornerRadius(32.5)
                                            .shadow(radius: 10)
                                    }
                                }
                        }
                }
                .padding()

            }
            .padding(10)
            .background(
                ZStack {
                    Color.init(hexString: "02B46C")
                    
                    RadialGradient(
                        colors: [.white.opacity(0.07), .white.opacity(0.0)],
                        center: .top,
                        startRadius: 0,
                        endRadius: 200
                    )
                }
            )
            .cornerRadius(20)
            .padding(1)
        }
        .background(.seaFoamGreen)
        .cornerRadius(20)
        .padding(.horizontal)
    }

}

#Preview {
    Group {
        OnboardingPanelView(
            label: "Become Healthy with",
            title: "Yuca: AI Scanner",
            onContinue: {
                
            },
            description: "Choose only high quality foods and know everything you eat"
        )
        OnboardingPanelView(
            label: "Become Healthy with",
            title: "Yuca: AI Scanner",
            onContinue: {
                
            },
            description: "Choose only high quality foods and know everything you eat",
            withGradient: true
        )
    }
}
