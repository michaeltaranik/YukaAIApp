//
//  TakePhotoButtonView.swift
//  YukaAI
//
//  Created by Michael Taranik on 01.10.2024.
//

import SwiftUI

#warning("add scale effect to the button")

struct TakePhotoButtonView: View {
    
    let onTap: () -> Void
    var outerSize: CGFloat = 72
    
    private var lineWidth: CGFloat { outerSize / 18 }
    
    var body: some View {
        Button {
            HapticManager.shared.impact(style: .medium)
            onTap()
        } label: {
            Circle()
                .stroke(lineWidth: outerSize / 18)
                .fill(.white)
                .frame(width: outerSize, height: outerSize)
                .overlay {
                    Circle()
                        .frame(width: outerSize - 2*lineWidth, height: outerSize - 2*lineWidth)
                        .foregroundColor(.white)
                }
        }
    }
}

#Preview {
    TakePhotoButtonView(onTap: {})
}
