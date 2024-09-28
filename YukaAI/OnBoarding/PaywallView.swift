//
//  PaywallView.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.09.2024.
//

import SwiftUI

struct PaywallView: View {
    var body: some View {
        ZStack {
            ZStack {
                VStack(spacing: 0) {
                    OnboardingImageView(image: "paywallScreen")
                    
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [.mossGreen, .greenGradient2],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .ignoresSafeArea()
                VStack {
                    LinearGradient(
                        stops: [.init(color: .black.opacity(0.6), location: 0),
                                .init(color: .clear, location: 0.2)],
                        startPoint: .top,
                        endPoint: .bottom)
                    
                }
                .ignoresSafeArea()
            }
            
            VStack {
                Spacer()
                
                SubscriptionView(
                    title: "Unlock the Assistant",
                    description: "Get the full functionality",
                    features: [
                        "Get personalised AI Assistant",
                        "Access your Progress and History",
                        "Scan without using the Barcode"
                    ],
                    price: "$4.99/mo",
                    onSubscribe: {
                        print("Subscribed")
                    },
                    onTermsTap: {
                        print("Terms tapped")
                    },
                    onPrivacyTap: {
                        print("Privacy tapped")
                    },
                    onRestoreTap: {
                        print("Restore tapped")
                    },
                    onMaybeLater: {
                        print("Maybe later tapped")
                    }
                )
            }
        }
    }
}

#Preview {
    PaywallView()
}
