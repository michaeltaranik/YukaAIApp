//
//  ShowIndicatorView.swift
//  YukaAI
//
//  Created by Michael Taranik on 09.08.2024.
//

import SwiftUI

struct ShowIndicatorView: View {
    
    var image: Image
    
    var body: some View {
        ZStack {
            Circle()
                .frame(height: 40)
            image
                .foregroundColor(.accentInverted)
                .font(.title2)
                .bold()
            
        }
        .shadow(radius: 5)
    }
}

#Preview {
    ZStack {
//        Color(.lightGreen)
//            .ignoresSafeArea()
        ShowIndicatorView(image: Image(systemName: "chevron.up"))
    }
}
