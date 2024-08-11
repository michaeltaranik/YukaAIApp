//
//  AccountView.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.07.2024.
//

import SwiftUI


struct AccountView: View {
    @State var darkMode = false
    @State var showHealth = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                List {
                    Section {
                        HStack {
                            Image(.avatarIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .mask {
                                    Circle()
                                }
                            VStack(alignment: .leading) {
                                Text("First Last")
                                    .font(.title)
                                    .foregroundStyle(.primary)
                                Text("Personal details")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            
                        }
                    }
                    Section {
                        NavButtonView(
                            image: Image(systemName: "heart.fill"),
                            color: Color(.red),
                            label: "Connect Apple Health")
                        NavButtonView(
                            image: Image(systemName: "translate"),
                            color: Color(.orange),
                            label: "Language")
                        NavButtonView(
                            image: Image(systemName: "sun.max.fill"),
                            color: Color(.purple),
                            label: "Dark theme")
                        NavButtonView(
                            image: Image(systemName: "questionmark.circle.fill"),
                            color: Color(.darkGreen),
                            label: "Help")
                        NavButtonView(
                            image: Image(systemName: "person.crop.circle.badge.questionmark"),
                            color: Color(.cyan),
                            label: "Support")
                        NavButtonView(
                            image: Image(systemName: "eraser.line.dashed.fill"),
                            color: Color(.darkRed),
                            label: "Delete all data")
                    }
                    signOutButton
                }
//                .scrollContentBackground(.hidden)
                .navigationTitle(
                    Text("Profile")
                        .foregroundColor(.black))
                //            .navigationBarTitleDisplayMode(.inline)
//                signOutButton
                
                
            }
        }
    }
}



extension AccountView {
    
    var signOutButton: some View {
        Button {
            print("sign out...")
        } label: {
            HStack {
                Spacer()
                Text("Sign out")
                    .foregroundStyle(.red)
                    .bold()
                Spacer()
            }
        }
        .buttonStyle(ButtonPressableStyle())
    }
    
    
    var background: some View {
        LinearGradient(
            gradient:
                Gradient(
                    colors: [
                        Color(red: 0.7, green: 1.0, blue: 0.9),
                        Color(red: 1.0, green: 1.0, blue: 0.8),
                        Color(red: 0.7, green: 1.0, blue: 0.9)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
    
}

#Preview {
    AccountView()
}

