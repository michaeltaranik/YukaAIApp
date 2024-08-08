//
//  AssistantAdviceView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.08.2024.
//

import SwiftUI

struct AssistantAdviceView: View {
    
    let headline: String
    let subheadline: String = "Get an answer based on your cart"

    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .frame(width: 270, height: 80)
                .foregroundColor(.accentInverted)
                .padding(.vertical, 3)
                .padding(.horizontal, 5)
                .shadow(radius: 3)
            VStack (alignment: .leading) {
                Text(headline)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(.accent)
                Text(subheadline)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    AssistantAdviceView(headline: "What can I cook?")
}
