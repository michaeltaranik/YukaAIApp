//
//  SubscriptionFooterView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.09.2024.
//

import SwiftUI

struct SubscriptionFooterView: View {
    let onTermsTap: () -> Void
    let onPrivacyTap: () -> Void
    let onRestoreTap: () -> Void
    let onMaybeLater: () -> Void

    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Button(action: onTermsTap) {
                    Text("Terms")
                        .underline()
                        .foregroundColor(Color.white.opacity(0.7))
                }

                Text("•")
                    .foregroundColor(Color.white.opacity(0.7))

                Button(action: onPrivacyTap) {
                    Text("Privacy")
                        .underline()
                        .foregroundColor(Color.white.opacity(0.7))
                }

                Text("•")
                    .foregroundColor(Color.white.opacity(0.7))

                Button(action: onRestoreTap) {
                    Text("Restore")
                        .underline()
                        .foregroundColor(Color.white.opacity(0.7))
                }
            }
            .padding(.bottom, 13)
            Button(action: onMaybeLater) {
                Text("Maybe later")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SubscriptionFooterView(onTermsTap: {
            
        }, onPrivacyTap: {
            
        }, onRestoreTap: {
            
        }, onMaybeLater: {
            
        })
    }
}
