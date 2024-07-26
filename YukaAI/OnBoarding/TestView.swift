//
//  TestView.swift
//  YukaAI
//
//  Created by Michael Taranik on 25.07.2024.
//

import SwiftUI

struct TestView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var counter = 0
    
    var body: some View {
        Text("Count: \(counter)")
        Button("Inc") {
            counter += 1
        }
        Button("Reset") {
            counter = 0
        }
    }
}

#Preview {
    TestView()
}
