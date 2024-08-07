//
//  WelcomeView.swift
//  YukaAI
//
//  Created by Michael Taranik on 24.07.2024.
//

import SwiftUI



struct WelcomeView: View {
    @AppStorage("sign_in") var currentUserLoggedIn: Bool = false
    
    var body: some View {
        if currentUserLoggedIn {
            HomeView()
        } else {
            IntroView()
        }
    }
}
//
//#Preview {
//    WelcomeView()
//}
