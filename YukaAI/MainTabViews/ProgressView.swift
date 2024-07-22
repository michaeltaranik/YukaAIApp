//
//  ProgressView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        ZStack {
            Color(.lightGreen)
                .ignoresSafeArea()
            Text("Your Progress!")
                .bold()
        }
    }
}

#Preview {
    ProgressView()
}
