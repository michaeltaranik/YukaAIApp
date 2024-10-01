//
//  TempHintView.swift
//  YukaAI
//
//  Created by Michael Taranik on 01.10.2024.
//

import SwiftUI

struct TempHintView: View {
    
    @State private var shouldShow = false
    
    var width: CGFloat = 160
    var height: CGFloat = 36
    var cornerRadius: CGFloat = 10
    var startTime: DispatchTimeInterval = .milliseconds(500)
    var endTime: DispatchTimeInterval = .seconds(3)
    
    var body: some View {
        HintView(width: width, height: height, cornerRadius: cornerRadius)
            .opacity(shouldShow ? 1 : 0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + startTime, execute: {
                    withAnimation {
                        shouldShow = true
                    }
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + endTime, execute: {
                    withAnimation {
                        shouldShow = false
                    }
                })
            }
    }
}

#Preview {
    TempHintView()
        .scaleEffect(2.5)
}
