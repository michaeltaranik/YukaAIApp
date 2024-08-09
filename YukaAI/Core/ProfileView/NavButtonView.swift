//
//  NavButtonView.swift
//  YukaAI
//
//  Created by Michael Taranik on 09.08.2024.
//

import SwiftUI

struct NavButtonView: View {
    
    let image: Image
    let color: Color
    let label: String
    
    
    
    var body: some View {
        NavigationLink {
            Text("hello pidr")
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        .frame(width: 30, height: 30)
                        .foregroundColor(color)
                    image
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                Text(label)
            }
        }

    }
}


#Preview {
    NavButtonView(image: Image(systemName: "heart.fill"),
                  color: Color(.red),
                  label: "Connect Apple Health")
    
}
