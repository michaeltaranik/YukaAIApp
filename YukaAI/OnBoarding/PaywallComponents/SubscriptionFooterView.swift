//
//  SubscriptionFooterView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.09.2024.
//

import SwiftUI

struct SubscriptionFooterView: View {
    
    let onTermsTap: () -> Void
    let onPrivacyTap: () -> Void
    let onRestoreTap: () -> Void
    let onMaybeLater: () -> Void
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                policyButton(name: "Terms", function: onTermsTap)
                
                spaceDot
                
                policyButton(name: "Privacy", function: onPrivacyTap)
                
                spaceDot
                
                policyButton(name: "Restore", function: onRestoreTap)
            }
            .padding(.bottom, 13)
            
            maybeLaterButton
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SubscriptionFooterView(onTermsTap: {
            
        }, onPrivacyTap: {
            
        }, onRestoreTap: {
            
        }, onMaybeLater: {
            
        })
    }
}

extension SubscriptionFooterView {
    fileprivate func policyButton(name: String, function: @escaping () -> Void) -> Button<Text> {
        return Button {
            HapticManager.shared.impact(style: .medium)
            function()
        } label: {
            Text(name)
                .underline()
                .foregroundColor(Color.white.opacity(0.7))
                .font(.system(size: 16, weight: .regular, design: .rounded))
        }
    }
    
    var spaceDot: some View {
        Text("•")
            .foregroundColor(Color.white.opacity(0.7))
    }
    
    var maybeLaterButton: some View {
        Button {
            HapticManager.shared.impact(style: .light)
            onMaybeLater()
        } label:  {
            Text("Maybe later")
                .font(.system(size: 16, design: .rounded))
                .foregroundColor(.white)
                .padding(.bottom, 20)
        }
    }
}
