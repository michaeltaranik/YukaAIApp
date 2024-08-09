//
//  AIAssistantView.swift
//  YukaAI
//
//  Created by Michael Taranik on 31.07.2024.
//

import SwiftUI
import OpenAI

struct AIAssistantView: View {
    
    @State var textFieldText: String = ""
    @State var showKeyboard: Bool = false
//    @State private var animation = false
    @State private var scaleFirst: CGFloat = 1
    @State private var scaleSecond: CGFloat = 1

    
    @StateObject private var chatController = ChatController()
    @StateObject private var cartVM = CartViewModel()
    
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(chatController.messages) {
                    message in
                    MessageView(message: message)
                        .padding(.horizontal, 15)
                }
            }
            ScrollView(.horizontal) {
                recommendations
            }
            .scrollIndicators(.hidden)
            
            Divider()
            HStack {
                TextField("Message...", text: self.$textFieldText, axis: .vertical)
                    .padding(5)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                Button {
                    chatController.sendNewMessage(content: textFieldText)
                    textFieldText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                } label: {
                    Image(systemName: "paperplane.fill")
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
                        .background(.accent)
                        .foregroundColor(.accentInverted)
                        .clipShape(RoundedRectangle(
                            cornerSize: CGSize(width: 20, height: 20)))
                    Spacer()
                }
            }
        }
    }
}


extension AIAssistantView {
    
    
    
    var recommendations: some View {
        HStack {
            Button {
                HapticManager.shared.impact(style: .light)
                let productsToSend = "\(cartVM.products.map(\.name).joined(separator: ", "))"
                chatController.sendNewMessage(content: "reccomend what can i cook based on these products: \(productsToSend)")
                withAnimation(.bouncy(duration: 0.1)) {
                    scaleFirst -= 0.1
                }
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                        withAnimation {
                            scaleFirst = 1.0
                        }
                }
            } label: {
                AssistantAdviceView(headline: "What can I cook?")
            }
            .scaleEffect(CGSize(
                width: scaleFirst,
                height: scaleFirst))
//            .animation(.bouncy, value: animation)
            
            Button {
                HapticManager.shared.impact(style: .light)
                let productsToSend = "\(cartVM.products.map(\.name).joined(separator: ", "))"
                chatController.sendNewMessage(content: "reccomend What should I buy instead of these products: \(productsToSend)")
                withAnimation(.bouncy(duration: 0.1)) {
                    scaleSecond -= 0.1
                }
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                        withAnimation {
                            scaleSecond = 1.0
                        }
                }
            } label: {
                AssistantAdviceView(headline: "What should I buy instead?")
            }
            .scaleEffect(CGSize(
                width: scaleSecond,
                height: scaleSecond))
            
        }
    }
    
    
}


#Preview {
    AIAssistantView()
}
