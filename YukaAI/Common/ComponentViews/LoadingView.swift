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
//                .opacity(1)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .darkGreen ))
                .background(.lightGreen)
        }
    }
}

#Preview {
    LoadingView()
}
