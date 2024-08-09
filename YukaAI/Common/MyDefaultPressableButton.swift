//
//  MyDefaultPressableButton.swift
//  YukaAI
//
//  Created by Michael Taranik on 09.08.2024.
//

import SwiftUI

struct ButtonPressableStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
    
    
}
