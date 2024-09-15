//
//  SubscriptionFeatureListView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.09.2024.
//

import SwiftUI

struct SubscriptionFeatureListView: View {
    let features: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ForEach(features, id: \.self) { feature in
                SubscriptionFeatureView(text: feature)
            }
        }
    }
}

struct SubscriptionFeatureView: View {
    let text: String

    var body: some View {
        HStack {
            Image("checkmarkSub")
                .mask {
                    Image(systemName: "checkmark.circle.fill")
                }
                .blendMode(.plusLighter)
                .font(.title2)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .regular))
        }
    }
}


#Preview {
//    SubscriptionFeatureListView(features: [])
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
