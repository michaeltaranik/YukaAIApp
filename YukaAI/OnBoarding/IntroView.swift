//
//  IntroView.swift
//  YukaAI
//
//  Created by Michael Taranik on 24.07.2024.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        NavigationStack {
            ZStack {
            LinearGradient(colors: [.green, .lightGreen], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
                VStack{
                    Text("YukaAI")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.darkGreen)
                        .padding()
                    Image(.default)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    loginButton
                    signinButton
                }
            }
        }
    }
    
    var loginButton: some View {
        NavigationLink {
            LogInView()
        } label: {
            Text("Log In")
            .frame(width: 300, height: 70)
            .font(.system(size: 24, weight: .semibold))
            .foregroundStyle(.darkGreen)
            .background(.lightGreen)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
        
    }
    
    var signinButton: some View {
        NavigationLink {
            CreateUserView(name: "Michael", surname: "Taranik")
        } label: {
            Text("Sign In")
                .frame(width: 300, height: 70)
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.darkGreen)
                .background(.lightGreen)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.bottom)
        }
        
        
    }
}

#Preview {
    IntroView()
}
