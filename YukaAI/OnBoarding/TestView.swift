//
//  TestView.swift
//  YukaAI
//
//  Created by Michael Taranik on 25.07.2024.
//

import SwiftUI

struct TestView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        ZStack {
            Color.blue
            VStack {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Username",
                              text: $username)
                }   .padding()
                    .background(Capsule().fill(Color.white))
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.secondary)
                    if showPassword {
                        TextField("Password",
                                  text: $password)
                    } else {
                        SecureField("Password",
                                    text: $password)
                    }
                    Button(action: { self.showPassword.toggle()}) {
                        
                        Image(systemName: "eye")
                            .foregroundColor(.secondary)
                    }
                }   .padding()
                    .background(Capsule().fill(Color.white))
            }   .padding()
        }
    }
}

#Preview {
    TestView()
}
