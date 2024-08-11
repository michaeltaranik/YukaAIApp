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
                    header
                    
                    upperBody
                    
                    lowerBody
                    
                    signOutButton
                }
                .scrollContentBackground(.hidden)
                .navigationTitle(Text("Profile"))
            }
        }
        .font(.system(.body, design: .rounded))
    }
}



extension AccountView {
    
    
    var header: some View {
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
                        .font(.system(.title, design: .rounded))
                        .foregroundStyle(.primary)
                    Text("Personal details")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                
            }
        }
    }
    
    var upperBody: some View {
        Section {
            darkModeButton
            NavButtonView(
                image: Image(systemName: "heart.fill"),
                color: Color(.red),
                label: "Connect Apple Health")
            NavButtonView(
                image: Image(systemName: "translate"),
                color: Color(.orange),
                label: "Language")
        }
    }
    
    var darkModeButton: some View {
        Toggle(isOn: $darkMode) {
            Section {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            .frame(width: 30, height: 30)
                            .foregroundColor(.indigo)
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    Text("Dark mode")
                }
            }
        }
    }
    
    var lowerBody: some View {
        Section {
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
    }
    
    var signOutButton: some View {
        Button {
            print("sign out")
        } label: {
            Section {
                HStack {
                    Spacer()
                    Text("Sign out")
                        .foregroundStyle(.red)
                        .bold()
                    Spacer()
                }
            }
        }
        .buttonStyle(ButtonPressableStyle())
    }
    
    
    var background: some View {
//        LinearGradient(
//            gradient:
//                Gradient(
//                    colors: [
//                        Color(red: 0.7, green: 1.0, blue: 0.9),
//                        Color(red: 1.0, green: 1.0, blue: 0.8),
//                        Color(red: 0.7, green: 1.0, blue: 0.9)]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
        Color(.accentBack)
            .ignoresSafeArea()
    }
    
}

#Preview {
    AccountView()
}

