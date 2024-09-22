//
//  SwiftUIView.swift
//  YukaAI
//
//  Created by Michael Taranik on 18.09.2024.
//

import SwiftUI

struct AnimatedBlurImage: View {
    @State private var isBlurred = false

    var body: some View {
        VStack {
            Image("screen1")
                .resizable()
                .scaledToFit()
                .blur(radius: isBlurred ? 20 : 0)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 300, height: 300)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isBlurred.toggle()
                    }
                }
            Text(isBlurred ? "Tap to unblur" : "Tap to blur")
                .font(.headline)
                .padding()
        }
    }
}

struct AnimatedBlurImage_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBlurImage()
    }
}

