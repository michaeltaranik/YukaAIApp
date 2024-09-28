//
//  ContentView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.07.2024.
//

import SwiftUI

struct HomeView: View {
    /*@AppStorage("isSignedIn")*/
    @State
    private var isSignedIn: Bool = false
    
    var body: some View {
        if isSignedIn {
            BarcodeScannerView()
        } else {
            OnboardingView(isOnboardingComplete: $isSignedIn)
        }
    }
}

#Preview {
    HomeView()
}
