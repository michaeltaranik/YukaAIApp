//
//  HealthView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct HealthView: View {
    @Binding var showHealthView: Bool
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
                Text("Dismiss")
                    .frame(width: 200, height: 100)
                    .background(.lightRed)
                    .foregroundColor(.darkRed)
                    .font(.system(size: 25, weight: .semibold))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .onTapGesture {
                        showHealthView.toggle()
                    }
            }
        }
        .task {
            await healthManager.requestAuthorization()
        }
    }
}

#Preview {
    HealthView(showHealthView: .constant(false))
}
