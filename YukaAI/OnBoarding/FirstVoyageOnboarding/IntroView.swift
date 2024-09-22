//
//  IntroView.swift
//  YukaAI
//
//  Created by Michael Taranik on 24.07.2024.
//

import SwiftUI

struct IntroView: View {
    
    @Binding var isSignedIn: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
            LinearGradient(colors: [.green, .lightGreen], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
                VStack{
                    Text("YukaAI")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.darkGreen)
                        .padding()
                    Image(.default)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    loginButton
//                    signinButton
                }
            }
        }
    }
    
    var loginButton: some View {
        Text("Start my journey!")
        .frame(width: 300, height: 70)
        .font(.system(size: 24, weight: .semibold))
        .foregroundColor(.darkGreen)
        .background(Color.lightGreen)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
        .onTapGesture {
            Task {
//                try await AuthenticationManager.shared.signIn()
                withAnimation {
                    isSignedIn = true
                }
            }
        }
        
    }
    
    var signinButton: some View {
        NavigationLink {
            SignInView()
        } label: {
            Text("Sign In")
                .frame(width: 300, height: 70)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.darkGreen)
                .background(Color.lightGreen)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.bottom)
        }
        
        
    }
}

#Preview {
    IntroView(isSignedIn: .constant(false))
}
