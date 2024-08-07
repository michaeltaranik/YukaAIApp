//
//  AIAssistantView.swift
//  YukaAI
//
//  Created by Michael Taranik on 31.07.2024.
//

import SwiftUI
import OpenAI

struct AIAssistantView: View {
    
    @ObservedObject var chatController: ChatController
    @State var textFieldText: String = ""
    @State var showKeyboard: Bool = false
    
    
    var body: some View {
        VStack {
            ScrollView {
                Image(.assistant)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(60)
                    .opacity(0.8)
                
                ForEach(chatController.messages) {
                    message in
                    MessageView(message: message)
                        .padding(.horizontal, 15)
                }
            }
            Divider()
            HStack {
                TextField("Message...", text: self.$textFieldText, axis: .vertical)
                    .padding(5)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                Button {
                    self.chatController.sendNewMessage(content: textFieldText)
                    textFieldText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            .padding()
        }
    
        
    }
}

struct MessageView: View {
    var message: Message
    var body: some View {
        Group {
            if message.isUser {
                HStack (alignment: .top) {
                    Spacer()
                    Text(message.content)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(
                            cornerSize: CGSize(width: 20, height: 20)))
                }
            } else {
                HStack (alignment: .top) {
                    Image(.assistant)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text(message.content)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(
                            cornerSize: CGSize(width: 20, height: 20)))
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AIAssistantView(chatController: .init())
}
