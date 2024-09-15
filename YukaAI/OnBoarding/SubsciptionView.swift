//
//  SubsciptionView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.09.2024.
//

import SwiftUI

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Header Text
            Text("Unlock the Assistant")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .background(
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.51, green: 0.63, blue: 0.47).opacity(0.75), Color(red: 0.44, green: 0.77, blue: 0.96)]), startPoint: .leading, endPoint: .trailing)
                        Color.black.opacity(0.3)
                    }
                )
                .cornerRadius(20)
                .padding()
            // Subheader Text
            Text("Get the full functionality")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.white.opacity(0.7))
                .padding(.bottom, 10)

            // Features List
            VStack(alignment: .leading, spacing: 15) {
                subscriptionFeature(text: "Get personalised AI Assistant")
                subscriptionFeature(text: "Access your Progress and History")
                subscriptionFeature(text: "Scan without using the Barcode")
            }

            // Subscription Button
            HStack {
                Button(action: {
                    // Subscription action here
                }) {
                    Text("Get membership")
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.vertical, 15)
                        .padding(.horizontal, 25)
                        .foregroundColor(.black)
                        
                }
                .shadow(radius: 10)

                Spacer()

                Text("$4.99/mo")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.secondary)
                    .padding(.trailing)
            }
            .background(Color.white)
            .cornerRadius(40)
            .padding(.horizontal, 20)

            // Footer Information
            Text("Auto-renewable. Cancel anytime")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.white.opacity(0.7))

            // Terms & Privacy
            HStack {
                Button(action: {
                    // Terms action
                }) {
                    Text("Terms")
                        .underline()
                        .foregroundColor(Color.white.opacity(0.7))
                }

                Text("•")
                    .foregroundColor(Color.white.opacity(0.7))

                Button(action: {
                    // Privacy action
                }) {
                    Text("Privacy")
                        .underline()
                        .foregroundColor(Color.white.opacity(0.7))
                }

                Text("•")
                    .foregroundColor(Color.white.opacity(0.7))

                Button(action: {
                    // Restore action
                }) {
                    Text("Restore")
                        .underline()
                        .foregroundColor(Color.white.opacity(0.7))
                }
            }

            // "Maybe later" button
            Button(action: {
                // Maybe later action
            }) {
                Text("Maybe later")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
            }
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.green, Color.green.opacity(0.7)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .padding(.horizontal, 40)
    }

    

}

#Preview {
    SubscriptionView()
}

extension SubscriptionView {
    fileprivate func subscriptionFeature(text: String) -> some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(Color.green.opacity(0.8))
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .regular))
        }
    }
}
