//
//  ScanningView.swift
//  YukaAI
//
//  Created by Michael Taranik on 23.07.2024.
//

import SwiftUI
import CodeScanner

struct ScanningView: View {
    @State private var isShowingScanner = true
    
    var body: some View {
        NavigationStack {
            NavigationLink("Open Scanner") {
                CodeScannerView(
                    codeTypes: [.qr],
                    simulatedData: "Paul Hudson\npaul@hackingwithswift.com",
                    completion: handleScan)
            }
            .foregroundStyle(.darkGreen)
            .frame(width: 200, height: 100)
            .background(.lightGreen)
            .cornerRadius(10)
            .shadow(radius: 10)
            .sheet(isPresented: $isShowingScanner) {
                        CameraView { code in
                            self.isShowingScanner = true
                        }
                    }
        }
        }
    
    
    func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = true
       // more code to come
    }
}




#Preview {
    ScanningView()
}
