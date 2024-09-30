//
//  PaywallView.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.09.2024.
//

import SwiftUI

struct PaywallView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    OnboardingImageView(image: "paywallScreen")
                    
                    greenRectangle
                }
                
                VStack {
                    Color.gradients.blackFade
                    
                    Spacer()
                    
                    subscriptionWindow
                }
            }
            .ignoresSafeArea()
            .toolbar { dismissButton }
        }
    }
}

#Preview {
    PaywallView()
}


extension PaywallView {
    var subscriptionWindow: some View {
        GetSubscriptionView(
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
                dismiss()
            }
        )
        .padding(.bottom, 35)
    }
    
    var greenRectangle: some View {
        Rectangle()
            .fill(K.onboarding.greenGradientBackground)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var dismissButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                HapticManager.shared.impact(style: .medium)
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.headline)
            }
        }
    }
}
