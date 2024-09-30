//
//  YukaAIApp.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.07.2024.
//

import SwiftUI

@main
struct YukaAIApp: App {
    
    @StateObject private var cartVM = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .font(.system(.body, design: .rounded))
                .environmentObject(cartVM)
        }
    }
}
