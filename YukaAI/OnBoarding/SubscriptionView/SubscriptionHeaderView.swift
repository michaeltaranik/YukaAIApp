//
//  SubscriptionHeaderView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.09.2024.
//

import SwiftUI

struct SubscriptionHeaderView: View {
    let title: String
    let description: String
    

    var firstColor: Color = Color.init(hexString: "82A078").opacity(0.75)
    var secondColor: Color = Color.init(hexString: "70C5F5")

    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .padding(10)
//                .background(.ultraThinMaterial)
                .background(
                    ZStack {
                        Image("headerSub")
                            .resizable()
                            .scaledToFill()
                            .blendMode(.overlay)
                            .offset(.init(width: 0, height: 40))
                        LinearGradient(colors: [firstColor, secondColor] /*[.greenish, .green]*/,
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                        .opacity(0.12)
                    }
                )
                .cornerRadius(20)
                .padding(.vertical, 10)
            Text(description)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.white.opacity(0.7))
        }
    }
}


#Preview {
//    ZStack {
//        Color.greenGradient2.edgesIgnoringSafeArea(.all)
//        SubscriptionHeaderView(title: "Assistive AI", description: "Unlock the full potential of YukaAI")
//    }
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
