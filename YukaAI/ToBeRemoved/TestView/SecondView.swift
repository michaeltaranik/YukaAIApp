//
//  SecondView.swift
//  YukaAI
//
//  Created by Michael Taranik on 21.07.2024.
//

import SwiftUI


struct DefaultGreenButtonStyle: ViewModifier {
    
    @Binding var showHeart: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(!showHeart ? .darkGreen : .darkRed)
            .frame(width: 200, height: 50)
            .background(!showHeart ? .lightGreen : .lightRed)
            .cornerRadius(10)
            .shadow(
                color: !showHeart ? .green.opacity(0.4) : .red.opacity(0.4),
                radius: 15, x: 0, y: 10)
    }
}





extension View {
    
    func withGreenButtonStyle(showHeart: Binding<Bool> = .constant(false)) -> some View {
        self.modifier(DefaultGreenButtonStyle(showHeart: showHeart))
    }
    

    
}


struct SecondView: View {
    
    @State var showHeart = false
    
    var body: some View {
        
        Spacer()
        if showHeart {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .padding(40)
                .transition(AnyTransition.scale.animation(.easeInOut))
        }
        Spacer()
        Button {
            showHeart.toggle()
        } label: {
            Text(showHeart ? "Hide Heart" :"Show Heart")
                
                .withGreenButtonStyle(showHeart: $showHeart)
                .padding(40)
                
        }
        .buttonStyle(ButtonPressableStyle())

    }
}

#Preview {
    SecondView()
}
