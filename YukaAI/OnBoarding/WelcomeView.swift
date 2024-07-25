//
//  WelcomeView.swift
//  YukaAI
//
//  Created by Michael Taranik on 24.07.2024.
//

import SwiftUI

enum PhaseView {
    case intro
    case login
    case sign
    case createUser
}

struct WelcomeView: View {
    @State var phaseView: PhaseView = .intro
    
    var body: some View {
        switch phaseView {
        case .intro:
            IntroView()
        case .login:
            LogInView()
        case .sign:
            CreateUserView(name: "Michael", surname: "Taranik")
        case .createUser:
            CreateUserView(name: "Michael", surname: "Taranik")
        }
    }
}

#Preview {
    WelcomeView()
}
