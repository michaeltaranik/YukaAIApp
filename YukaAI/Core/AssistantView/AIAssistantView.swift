//
//  AIAssistantView.swift
//  YukaAI
//
//  Created by Michael Taranik on 31.07.2024.
//

import SwiftUI
import OpenAI
import Combine

struct AIAssistantView: View {
    
    @State var textFieldText: String = ""
    @State var showKeyboard: Bool = false
    @State var shouldShowRecs: Bool = true
    
    @StateObject private var chatController = ChatController()
    @StateObject private var cartVM = CartViewModel()
    
    @Namespace private var animation
    
    
    var body: some View {
        VStack {
            ZStack {
                messagesView
                VStack {
                    Spacer()
                    reccomendationsView
                }
            }
            if !shouldShowRecs {
                Divider()
            }
            textFieldView
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
    
    var messagesView: some View {
        ScrollView {
            ScrollViewReader { proxy in
                ForEach(chatController.messages) {
                    message in
                    MessageView(message: message)
                        .padding(.horizontal, 15)
                        .id(message.id)
                }
                .onReceive(Just(chatController.messages)) { newCount in
                    withAnimation (.spring()) {
                        proxy.scrollTo(chatController.messages.last?.id, anchor: .bottom)
                    }
                }
            }
        }
    }
    
    var textFieldView: some View {
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
    }
    
    var reccomendationsView: some View {
        VStack (alignment: .leading, spacing: 0) {
            customIndicator
                .matchedGeometryEffect(id: "indicator", in: animation)
                .onTapGesture {
                    withAnimation (.spring()){
                        shouldShowRecs.toggle()
                    }
                    HapticManager.shared.impact(style: .soft)
                }
                .background(Color.gray.opacity(0.0))
                .padding()
                .shadow(radius: 3)
            ScrollView(.horizontal) {
                if shouldShowRecs {
                    recommendations
                }
            }
            .background(.ultraThinMaterial)
            .scrollIndicators(.hidden)
        }
        
        
    }
    
    @ViewBuilder
    var customIndicator: some View {
        if shouldShowRecs {
            ShowIndicatorView(image: Image(systemName: "chevron.down"))
                
            
        } else {
            ShowIndicatorView(image: Image(systemName: "chevron.up"))
                
        }
    }
    
    var recommendations: some View {
        HStack {
            Button {
                HapticManager.shared.impact(style: .light)
                let productsToSend = "\(cartVM.products.map(\.name).joined(separator: ", "))"
                chatController.sendNewMessage(content: "reccomend what can i cook based on these products: \(productsToSend)")
                withAnimation (.spring()){
                    shouldShowRecs = false
                }
                
            } label: {
                AssistantAdviceView(headline: "What can I cook?")
            }
            .buttonStyle(ButtonPressableStyle())
            
            Button {
                HapticManager.shared.impact(style: .light)
                let productsToSend = "\(cartVM.products.map(\.name).joined(separator: ", "))"
                chatController.sendNewMessage(content: "reccomend What should I buy instead of these products: \(productsToSend)")
                withAnimation (.spring()){
                    shouldShowRecs = false
                }
            } label: {
                AssistantAdviceView(headline: "What should I buy instead?")
            }
            .buttonStyle(ButtonPressableStyle())
        }
    }
    
    
}


#Preview {
    AIAssistantView()
}
