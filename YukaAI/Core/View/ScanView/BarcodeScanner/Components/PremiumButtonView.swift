//
//  PremiumButtonView.swift
//  YukaAI
//
//  Created by Michael Taranik on 02.10.2024.
//

import SwiftUI

struct PremiumButtonView: View {
    
    let onTap: () -> Void
    var isOldIcon: Bool = true
    
    var body: some View {
        Button {
            HapticManager.shared.impact(style: .medium)
            onTap()
        } label: {
            if isOldIcon {
                PremiumOldIconView()
            } else {
                PremiumIconView()
            }
        }
    }
}

#Preview {
    Group {
        PremiumButtonView(onTap: { })
        PremiumButtonView(onTap: { }, isOldIcon: false)
    }
}
