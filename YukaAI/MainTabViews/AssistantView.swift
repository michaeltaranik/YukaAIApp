//
//  AssistantView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct AssistantView: View {
    
//    @StateObject private var vm = ViewModel()
    @StateObject var chatController = ChatController()
    @State private var text = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Assistant")
                    .font(.system(size: 45, weight: .bold))
                    .padding()
                Spacer()
            }
            AIAssistantView(chatController: chatController)
        }
        .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
    }
}

#Preview {
    AssistantView()
}
