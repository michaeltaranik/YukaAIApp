//
//  ProgressView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        ZStack {
            GradientView()
            Text("Your Progress!")
                .bold()
        }
    }
}

#Preview {
    StatsView()
}
