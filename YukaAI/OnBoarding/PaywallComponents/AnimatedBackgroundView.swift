//
//  AnimatedBackgroundView.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.09.2024.
//

import SwiftUI

struct AnimatedBackgroundView: View {
    @Binding var animateGradient: Bool
    var duration = 10

    var body: some View {
        AngularGradient(
            gradient: Gradient(colors: [
                .mossGreen,
                .lightGreenGradient,
                .mossGreen
            ]),
            center: .center,
            angle: animateGradient ? .degrees(360) : .degrees(0)
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(Animation.linear(duration: TimeInterval(duration)).repeatForever(autoreverses: false)) {
                animateGradient.toggle()
            }
        }
        .shadow(color: .white.opacity(0.3), radius: 10, x: 15, y: 0)
    }
}


#Preview {
    VStack {
        AnimatedBackgroundView(animateGradient: .constant(true))
        GetSubscriptionView(
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


struct RandomAnimatedBackgroundView: View {
    @State private var startColor = Color.blue
    @State private var endColor = Color.purple
    @State private var animateGradient = false
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [startColor, endColor]),
            startPoint: animateGradient ? .topLeading : .bottomTrailing,
            endPoint: animateGradient ? .bottomTrailing : .topLeading
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: true)) {
                animateGradient.toggle()
            }
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                withAnimation(.linear(duration: 3)) {
                    startColor = randomColor()
                    endColor = randomColor()
                }
            }
        }
    }
    
    func randomColor() -> Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
