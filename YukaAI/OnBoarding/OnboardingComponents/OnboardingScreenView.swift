//
//  OnboardingScreenView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct OnboardingScreenView: View {
    let label: String
    let title: String
    let onContinue: () -> Void
    let description: String
    var isAnimated: Bool = false
    
    private let gradientDarkColors: [Color] = [.mossGreen, .cloverGreen]
    private let gradientLightColors: [Color] = [.mossGreen, .seaFoamGreen]
    private let mossGreenColors: [Color] = [.mossGreenLighter, .mossGreenLight]

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Text(label)
                    .fontWeight(.semibold)
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                SubscriptionHeaderView(title: title, description: description)
                    .padding(.bottom, 30)
                Button {
                    onContinue()
                } label: {
                    if !isAnimated {
                        Text("Continue")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                            }
                    } else {
                        SubscriptionButtonView(label: "Start Scanning") {
                            
                        }
                    }
                }
                .padding(isAnimated ? .top : .vertical)

            }
            .padding(10)
            .background(
                ZStack {
                    Color.init(hexString: "02B46C")
                    RadialGradient(
                        colors: [.white.opacity(0.07), .white.opacity(0.0)],
                        center: .top,
                        startRadius: 0,
                        endRadius: 200)
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
    ZStack {
        Color.black.ignoresSafeArea()
        OnboardingScreenView(
            label: "Become Healthy with",
            title: "Yuca: AI Scanner",
            onContinue: {
                
            },
            description: "Choose only high quality foods and know everything you eat"
        )
    }
}
