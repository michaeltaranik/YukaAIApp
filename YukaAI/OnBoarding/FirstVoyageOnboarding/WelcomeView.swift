//
//  WelcomeView.swift
//  YukaAI
//
//  Created by Michael Taranik on 24.07.2024.
//

import SwiftUI

struct WelcomeView: View {
    
    /*@AppStorage("isSignedIn")*/
    @State
    private var isSignedIn: Bool = false
    
    var body: some View {
        if isSignedIn {
            BarcodeScannerView()
        } else {
            IntroView(isSignedIn: $isSignedIn)
        }
    }
}

