//
//  LogInView.swift
//  YukaAI
//
//  Created by Michael Taranik on 24.07.2024.
//

import SwiftUI

struct LogInView: View {
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @State var sendEmail: Bool = true
    @State var showPassword: Bool = false
    
    
    @AppStorage("sign_in") var currentUserLoggedIn: Bool = false

    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .lightGreen], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            VStack {
                Text("Log In")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(.darkGreen)
                    .padding()
                //                Image(.default)
                //                    .resizable()
                //                    .scaledToFit()
                emailSection
                passwordSection
                sendingEmailSection
                Spacer()
                loginButton
            }
        }
    }
    
    var sendingEmailSection: some View {
        Toggle(isOn: $sendEmail, label: {
            HStack {
                Image(systemName: "envelope.fill")
                Text("I want to receive e-mails")
                    .frame(minWidth: 150)
                    .foregroundStyle(.darkGreen)
            }
        })
        .padding(50)
    }
    
    var emailSection: some View {
        VStack(alignment: .leading, content: {
            Text("E-mail")
                .foregroundStyle(.darkGreen)
                .font(.system(size: 20, weight: .semibold))
            HStack {
                Image(systemName: "envelope")
                    .foregroundStyle(.myGray)
                TextField("", text: $userEmail,
                          prompt: Text("E-mail")
                    .foregroundStyle(.myGray))
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            .padding(.leading)
            .frame(width: 320, height: 50)
            .background(.white)
            .foregroundColor(.black)
            .cornerRadius(20)
            
        })
        .shadow(radius: 5)
    }
    
    var passwordSection: some View {
        VStack(alignment: .leading, content: {
            Text("Password")
                .foregroundStyle(.darkGreen)
                .font(.system(size: 20, weight: .semibold))
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.myGray)
                    .padding(.leading)
                if showPassword {
                    TextField("",
                              text: $userPassword,
                              prompt: Text("Password")
                        .foregroundStyle(.myGray))
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                } else {
                    SecureField("",
                                text: $userPassword,
                                prompt: Text("Password")
                        .foregroundStyle(.myGray))
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                }
                Button(action: { self.showPassword.toggle()}) {
                    
                    Image(systemName: !showPassword ? "eye" : "eye.slash")
                        .foregroundColor(.myGray)
                        .padding()
                }
            }
            .frame(width: 320, height: 50)
            .background(.white)
            .foregroundColor(.black)
            .cornerRadius(20)
        })
        .shadow(radius: 5)
    }
    
    
    var loginButton: some View {
        Button("Log In") {
            self.currentUserLoggedIn = true
        }
        .frame(width: 300, height: 70)
        .font(.system(size: 24, weight: .semibold))
        .foregroundStyle(.darkGreen)
        .background(.lightGreen)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    LogInView()
}
