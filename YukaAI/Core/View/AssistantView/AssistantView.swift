//
//  AIAssistantView.swift
//  YukaAI
//
//  Created by Michael Taranik on 31.07.2024.
//

import SwiftUI
import OpenAI
import Combine

struct AssistantView: View {

    @StateObject private var vm = AssistantVM()
    @StateObject private var cartVM = CartViewModel()
    
    @State var textFieldText: String = ""
    
    @Namespace private var animation
    
    
    var body: some View {
        ZStack {
            Color(.accentBack)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    
                    messagesView
                    VStack {
                        Spacer()
                        reccomendationsView
                    }
                }
                if !vm.shouldShowRecs {
                    Divider()
                }
                textFieldView
                    .padding()
            }
        }
        .sheet(isPresented: $vm.shouldShowProfile, content: {
            AccountView()
        })
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
                        .font(.system(.body, design: .rounded))
                        .padding()
                        .background(.lightGrey)
                        .foregroundColor(.accentColor)
                        .clipShape(RoundedRectangle(
                            cornerSize: CGSize(width: 20, height: 20)))
                }
                .padding(.leading, 95)
                .padding(.bottom, 20)
            } else {
                HStack (alignment: .top) {
                    Image(.assistant)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text(message.content)
                        .font(.system(.body, design: .rounded))
                        .padding()
                        .foregroundColor(.accentColor)
                    Spacer()
                }
            }
        }
        
    }
}


extension AssistantView {
    
    var messagesView: some View {
        NavigationStack {
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(vm.messages) {
                        message in
                        MessageView(message: message)
                            .padding(.horizontal, 15)
                            .id(message.id)
                    }
                    .onChange(of: vm.messages.count) { newValue in
                        withAnimation {
                            proxy.scrollTo(vm.messages.last?.id, anchor: .bottom)
                        }
                    }
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(vm.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
                .padding(.bottom, 60)

            }
            .background(.accentBack)
            .navigationBarTitle("Assistant")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                AssistantToolbar {
                    withAnimation {
                        vm.shouldShowProfile.toggle()
                        HapticManager.shared.impact(style: .medium)
                    }
                }
            }
        }
        
    }
    
    var textFieldView: some View {
        HStack {
            TextField("Message...", text: $textFieldText, axis: .vertical)
                .padding(5)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
            Button {
                vm.sendNewMessage(content: textFieldText)
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
                .background(Color.gray.opacity(0.0))
                .padding()
                .shadow(radius: 3)
                .onTapGesture {
                    withAnimation (.spring()) {
                        vm.shouldShowRecs.toggle()
                    }
                    HapticManager.shared.impact(style: .soft)
                }
            ScrollView(.horizontal) {
                if vm.shouldShowRecs {
                    recommendations
                }
            }
            .background(.ultraThinMaterial)
            .scrollIndicators(.hidden)
        }
        
        
    }
    
    @ViewBuilder
    var customIndicator: some View {
        if vm.shouldShowRecs {
            ShowIndicatorView(image: Image(systemName: "chevron.down"))
        } else {
            ShowIndicatorView(image: Image(systemName: "chevron.up"))
        }
    }
    
    var recommendations: some View {
        HStack {
            Button {
                HapticManager.shared.impact(style: .light)
                
                let productsToSend = "\(cartVM.products.map(\.genericName).joined(separator: ", "))"
                vm.sendNewMessage(content: "reccomend what can i cook based on these products: \(productsToSend)")
                
                withAnimation (.spring()){
                    vm.shouldShowRecs = false
                }
            } label: {
                AssistantAdviceView(headline: "What can I cook?")
            }
            .buttonStyle(ButtonPressableStyle())
            
            Button {
                HapticManager.shared.impact(style: .light)
                let productsToSend = "\(cartVM.products.map(\.genericName).joined(separator: ", "))"
                vm.sendNewMessage(content: "reccomend What should I buy instead of these products: \(productsToSend)")
                
                withAnimation (.spring()){
                    vm.shouldShowRecs = false
                }
            } label: {
                AssistantAdviceView(headline: "What should I buy instead?")
            }
            .buttonStyle(ButtonPressableStyle())
        }
    }
    
    
}


#Preview {
    AssistantView()
}
