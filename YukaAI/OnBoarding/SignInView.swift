//
//  SignInView.swift
//  YukaAI
//
//  Created by Michael Taranik on 25.07.2024.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var surname: String = ""
    @State var sendEmail: Bool = true
    @State private var showPassword = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.green, .lightGreen], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                VStack {
                    Text("Sign In")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.darkGreen)
                        .padding()
                    nameSection
                    emailSection
                    passwordSection
                    sendingEmailSection
                    Spacer()
                    signInButton
                }
            }
        }
    }
    
    
    var nameSection: some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text("Name")
                    .foregroundStyle(.darkGreen)
                    .font(.system(size: 20, weight: .semibold))
                TextField("Name", text: $name)
                    .padding(.leading)
                    .frame(width: 145, height: 50)
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .autocorrectionDisabled()
                
            })
            .padding(.horizontal)
            VStack(alignment: .leading, content: {
                Text("Surname")
                    .foregroundStyle(.darkGreen)
                    .font(.system(size: 20, weight: .semibold))
                TextField("Surname", text: $surname)
                    .padding(.leading)
                    .frame(width: 145, height: 50)
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .autocorrectionDisabled()
                
            })
            .padding(.horizontal)
            
        }
        .shadow(radius: 5)
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
                    .foregroundStyle(.secondary)
                TextField("E-mail", text: $email)
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
                    .foregroundColor(.secondary)
                    .padding(.leading)
                if showPassword {
                    TextField("Password",
                              text: $password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                } else {
                    SecureField("Password",
                                text: $password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                }
                Button(action: { self.showPassword.toggle()}) {
                    
                    Image(systemName: !showPassword ? "eye" : "eye.slash")
                        .foregroundColor(.secondary)
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
    
    
    var signInButton: some View {
        NavigationLink {
            CreateUserView(name: name, surname: surname)
        } label: {
            Text("Sign In")
                .frame(width: 300, height: 70)
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.darkGreen)
                .background(.lightGreen)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()
        }
    }
}

#Preview {
    SignInView()
}
