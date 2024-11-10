//
//  SingleBarView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.10.2024.
//

import SwiftUI

struct SingleBarView: View {
    
    @State private var animatedValue: CGFloat = 0
    
    var maxHeight: CGFloat = 300
    var maxValue: CGFloat = 100
    var value: CGFloat = 50
    var width: CGFloat = 20
    var color: Color = .cyan
    
    var body: some View {
        Rectangle()
            .fill(color.gradient)
            .clipShape(
                .rect(
                    topLeadingRadius: width / 3,
                    topTrailingRadius: width / 3
                )
            )
            .frame(width: width, height: animatedValue)
            .onAppear {
                withAnimation(.spring(duration: 0.7)) {
                    animatedValue = (value / maxValue) * maxHeight
                }
            }
    }
}

#Preview {
    SingleBarView()
}
