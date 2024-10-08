//
//  SignInView.swift
//  YukaAI
//
//  Created by Michael Taranik on 25.07.2024.
//

import SwiftUI

@available(iOS 15.0, *)
struct SignInView: View {
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @State var userName: String = ""
    @State var userSurname: String = ""
    @State var sendEmail: Bool = true
    @State private var showPassword = false
    
    
    @State var showAlert: Bool = false
    @State var alertTitle = "Error"
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.green, .lightGreen], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                VStack {
                    Text("Sign In")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.darkGreen)
                        .padding()
                    nameSection
                        .padding()
                    emailSection
                    passwordSection
                        .padding()
                    sendingEmailSection
                    Spacer()
                    signInButton
//                        .disabled(true)
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text(alertTitle))
                })
            }
        }
    }
    
    
    var nameSection: some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text("Name")
                    .foregroundColor(.darkGreen)
                    .font(.system(size: 20, weight: .semibold))
                TextField("Name", text: $userName, prompt: Text("Name")
                    .foregroundColor(.myGray))
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
                    .foregroundColor(.darkGreen)
                    .font(.system(size: 20, weight: .semibold))
                TextField("Surname", text: $userSurname, prompt: Text("Surname")
                    .foregroundColor(.myGray))
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
                    .foregroundColor(.darkGreen)
            }
        })
        .padding(50)
    }
    
    var emailSection: some View {
        VStack(alignment: .leading, content: {
            Text("E-mail")
                .foregroundColor(.darkGreen)
                .font(.system(size: 20, weight: .semibold))
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.myGray)
                TextField("", text: $userEmail,
                          prompt: Text("E-mail")
                    .foregroundColor(.myGray))
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
                .foregroundColor(.darkGreen)
                .font(.system(size: 20, weight: .semibold))
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.myGray)
                    .padding(.leading)
                if showPassword {
                    TextField("",
                              text: $userPassword, 
                              prompt: Text("Password")
                        .foregroundColor(.myGray))
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                } else {
                    SecureField("",
                                text: $userPassword,
                                prompt: Text("Password")
                        .foregroundColor(.myGray))
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
    
    
    var signInButton: some View {
        NavigationLink {
            if handleButton() {
                CreateUserView(name: userName, surname: userSurname)
            } else {
                
            }
        } label: {
            Text("Sign In")
                .frame(width: 300, height: 70)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.darkGreen)
                .background(.lightGreen)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()
        }
    }
}



@available(iOS 15.0, *)
extension SignInView {
    
    func handleButton() -> Bool {
        print(userName.count-1)
        if userName.count < 2 {
            alertTitle = "'Name' has to contain at least 2 characters"
            showAlert.toggle()
            return false
        }
        
        return true
    }
}


#Preview {
    if #available(iOS 15.0, *) {
        SignInView()
    } else {
        // Fallback on earlier versions
    }
}
