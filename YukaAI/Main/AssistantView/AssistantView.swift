//
//  AssistantView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct AssistantView: View {
    
    @State private var text = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Assistant")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundStyle(.accent)
                    .padding()
                Spacer()
            }
            AIAssistantView()
        }
        .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
    }
}

#Preview {
    AssistantView()
}
