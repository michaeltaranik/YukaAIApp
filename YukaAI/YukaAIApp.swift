//
//  YukaAIApp.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.07.2024.
//

import SwiftUI

@main
struct YukaAIApp: App {
    
//    @StateObject private var vm = ScanViewModel()
    @StateObject private var productList: ProductList = ProductList()

    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
//                .environmentObject(vm)
//                .task {
//                    await vm.requestDataScannerAccessStatus()
//                }
                .environmentObject(productList)
                
        }
    }
}
