//
//  ConnectionView.swift
//  YukaAI
//
//  Created by Michael Taranik on 23.07.2024.
//

import SwiftUI

struct ConnectionView: View {
    @State private var healthManager = HealthManager()

    var body: some View {
        ZStack {
            Color(.lightRed)
                .ignoresSafeArea()
            VStack {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.linearGradient(colors: [Color(.red), Color(.lightRed)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding()
                Text("Connect your apple health to track your progress")
                Spacer()

            }
        }
        .task {
            await healthManager.requestAuthorization()
        }
    }
}

#Preview {
    ConnectionView()
}
