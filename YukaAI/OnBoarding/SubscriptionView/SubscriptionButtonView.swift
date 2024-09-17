//
//  SubscriptionButtonView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.09.2024.
//

import SwiftUI

struct SubscriptionButtonView: View {
    let price: String
    let onSubscribe: () -> Void
    @State private var isAnimated: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button(action: onSubscribe) {
                    Text("Get subscription")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 25)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(price)
                        .padding(.trailing, 18)
                        .font(.system(size: 17, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                }
                .background(.ultraThickMaterial)
                .cornerRadius(40)
                .shadow(radius: 10)
                .padding(10)
                .background(
                    AnimatedBackgroundView(animateGradient: $isAnimated)
                        .cornerRadius(40)
                )
            }
            .padding(.horizontal, 10)
            .shadow(color: .white.opacity(0.2),
                    radius: 10,
                    x: isAnimated ? 10 : -10,
                    y: isAnimated ? -10 : 10)
            Text("Auto-renewable. Cancel anytime")
                .foregroundStyle(.white.opacity(0.4))
        }
    }
}


#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 30) {
            SubscriptionButtonView(price: "$4,99/mo") {
                print("Subscribed")
            }
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
    
}
