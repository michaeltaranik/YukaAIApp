//
//  SubsciptionView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.09.2024.
//

import SwiftUI

struct SubscriptionView: View {
    let title: String
    let description: String
    let features: [String]
    let price: String
    let onSubscribe: () -> Void
    let onTermsTap: () -> Void
    let onPrivacyTap: () -> Void
    let onRestoreTap: () -> Void
    let onMaybeLater: () -> Void
    
    private let gradientDarkColors: [Color] = [.mossGreen, .cloverGreen]
    private let gradientLightColors: [Color] = [.mossGreen, .seaFoamGreen]
    private let mossGreenColors: [Color] = [.mossGreenLighter, .mossGreenLight]

    var body: some View {
        ZStack {
            VStack(spacing: 35) {
                SubscriptionHeaderView(title: title, description: description)
                SubscriptionFeatureListView(features: features)
                SubscriptionButtonView(price: price, label: "Get Subscription", onTapGesture: onSubscribe)
                SubscriptionFooterView(
                    onTermsTap: onTermsTap,
                    onPrivacyTap: onPrivacyTap,
                    onRestoreTap: onRestoreTap,
                    onMaybeLater: onMaybeLater
                )
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

// Preview
#Preview {
    ZStack {
//        Color.greenGradient2.ignoresSafeArea()
        Color.black.ignoresSafeArea()
        SubscriptionView(
            title: "Unlock the Assistant",
            description: "Get the full functionality",
            features: [
                "Get personalised AI Assistant",
                "Access your Progress and History",
                "Scan without using the Barcode"
            ],
            price: "$4.99/mo",
            onSubscribe: { print("Subscribed") },
            onTermsTap: { print("Terms tapped") },
            onPrivacyTap: { print("Privacy tapped") },
            onRestoreTap: { print("Restore tapped") },
            onMaybeLater: { print("Maybe later tapped") }
        )
    }
}
