//
//  ColorExtension.swift
//  YukaAI
//
//  Created by Michael Taranik on 28.09.2024.
//

import Foundation
import SwiftUICore

extension Color {
    
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let backgroundAccent = Color("BackgroundAccentColor")
    let background = Color("BackgroundColor")
    let backgroundList = Color("BackgroundListColor")
    let cardBackground = Color("CardBackgroundColor")
    let primary = Color("PrimaryColor")
    let primaryText = Color("PrimaryTextColor")
    let secondaryText = Color("SecondaryTextColor")
    let temporary = Color.green.opacity(0.1)
    let iconBackColor = Material.ultraThin
    
}

struct DefaultColors {
    
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let blue = Color("BlueColor")
    let lightGray = Color("LightGrayColor")
    
}

struct LaunchTheme {
    
}
