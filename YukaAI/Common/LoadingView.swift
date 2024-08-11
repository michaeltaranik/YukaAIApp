//
//  LoadingView.swift
//  YukaAI
//
//  Created by Michael Taranik on 11.08.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.lightGreen)
                .ignoresSafeArea()
                .opacity(0.8)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .darkGreen ))
                .scaleEffect(3)
                .background(.lightGreen)
        }
    }
}
