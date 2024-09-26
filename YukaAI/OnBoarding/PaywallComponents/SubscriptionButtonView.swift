//
//  SubscriptionButtonView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.09.2024.
//

import SwiftUI

struct SubscriptionButtonView: View {
    var price: String?
    var label: String
    let onTapGesture: () -> Void
    @State private var isAnimated: Bool = true

    var body: some View {
        VStack {
            HStack {
                Button(action: onTapGesture) {
                    if (price != nil) {
                        Text(label)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 25)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(price!)
                            .padding(.trailing, 18)
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                    } else {
                        Text(label)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                            }
                    }
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
            if (price != nil) {
                Text("Auto-renewable. Cancel anytime")
                    .foregroundStyle(.white.opacity(0.4))
            }
        }
    }
}


#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 30) {
            SubscriptionButtonView(price: "$4,99/mo", label: "Get Subscription") {
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
