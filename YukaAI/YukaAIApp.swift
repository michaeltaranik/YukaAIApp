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


extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}
