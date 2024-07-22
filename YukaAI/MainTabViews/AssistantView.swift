//
//  AssistantView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct AssistantView: View {
    var body: some View {
        ZStack {
            Color(.lightGreen)
                .ignoresSafeArea()
            VStack {
                Image(systemName: "person.fill.questionmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.darkGreen)
                    .padding()
                Text("Ask me everything!")
                    .bold()
            }
        }
    }
}

#Preview {
    AssistantView()
}
