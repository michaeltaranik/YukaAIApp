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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    
    func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = false
       // more code to come
    }
}

#Preview {
    ScanningView()
}
