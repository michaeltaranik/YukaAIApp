//
//  ConfirmCheckView.swift
//  YukaAI
//
//  Created by Michael Taranik on 10.11.2024.
//

import SwiftUI

struct ConfirmCheckView: View {
    
//    @State var isAnimated: Bool = false
    @Binding var isAnimated: Bool
    
    var size: CGFloat = 50
    var duration: Double = 0.5
    var body: some View {
        Image(systemName: "checkmark.circle")
            .font(.system(size: size))
            .padding()
            .opacity(isAnimated ? 1 : 0)
//            .scaleEffect(isAnimated ? 1 : 0.5)
            .animation(.easeIn(duration: duration), value: isAnimated)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .onAppear {
                isAnimated.toggle()
            }
    }
}
//#Preview {
//    ConfirmCheckView()
//}
