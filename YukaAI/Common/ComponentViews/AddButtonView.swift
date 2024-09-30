//
//  AddButtonView.swift
//  YukaAI
//
//  Created by Michael Taranik on 15.08.2024.
//

import SwiftUI

struct AddButtonView: View {
    
    @Binding var showOptions: Bool
    let size: Double
    
    fileprivate func optionIcon(icon: String = "barcode.viewfinder", _ text: String = "Scan") -> some View {
        return VStack {
            Image(systemName: icon)
                .font(.system(size: size * 0.85, weight: .bold, design: .default))
            Text(text)
                .font(.system(size: size * 0.25, weight: .bold, design: .rounded))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerSize: CGSize(width: size * 2, height: size * 2))
                    .frame(width: size * 1.25, height: showOptions ? size * 5 : size)
                    .foregroundColor(!showOptions ? Color.white.opacity(0.0) : .accent)
                    .overlay {
                        if showOptions {
                            VStack {
                                optionIcon()
                                    .padding(.vertical, size * 0.15)
                                optionIcon(icon: "photo.circle.fill", "Browse")
                                    .padding(.bottom, size * 0.45)
                                Spacer()
                            }
                            .foregroundColor(.accentBack)
                        }
                    }
                VStack {
                    button
                        .rotationEffect(.degrees(showOptions ? 0 : -135))
                        .onTapGesture {
                            withAnimation (.easeInOut) {
                                showOptions.toggle()
                            }
                            HapticManager.shared.impact(style: .medium)
                        }
                }
            }
            
        }
    }
    
    
    var button: some View {
        Image(systemName: "xmark.circle.fill")
            .font(.system(size: size, weight: .bold))
            .foregroundColor(showOptions ? .accentBack : .accent)
    }
    
    
    
}





//
//
//#Preview {
//    AddButtonView()
//}
