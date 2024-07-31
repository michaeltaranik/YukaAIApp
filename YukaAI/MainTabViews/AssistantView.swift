//
//  AssistantView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct AssistantView: View {
    
//    @StateObject private var vm = ViewModel()
    @State private var text = ""
    
    var body: some View {
//        ZStack {
//            Color(.lightGreen)
//                .ignoresSafeArea()
//            VStack {
//                Image(systemName: "person.fill.questionmark")
//                    .resizable()
//                    .scaledToFit()
//                    .foregroundColor(.darkGreen)
//                    .padding()
//                Text("Ask me everything!")
//                    .bold()
//            }
//        }
        AIAssistantView()
    }
}

#Preview {
    AssistantView()
}
