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
    static let gradients = GradientColors()
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

struct GradientColors {
    
    let blackFade = LinearGradient(
        stops: [.init(color: .black.opacity(0.7), location: 0),
                .init(color: .clear, location: 0.25)],
        startPoint: .top,
        endPoint: .bottom
    )
    
    let orange = GradientColor(start: Colors.OrangeStart, end: Colors.OrangeEnd)
    let blue = GradientColor(start: Colors.GradientPurple, end: Colors.GradientNeonBlue)
    let green = GradientColor(start: Color(hexString: "0BCDF7"), end: Color(hexString: "A2FEAE"))
    let blu = GradientColor(start: Color(hexString: "0591FF"), end: Color(hexString: "29D9FE"))
    let bluPurpl = GradientColor(start: Color(hexString: "4ABBFB"), end: Color(hexString: "8C00FF"))
    let purple = GradientColor(start: Color(hexString: "741DF4"), end: Color(hexString: "C501B0"))
    let prplPink = GradientColor(start: Color(hexString: "BC05AF"), end: Color(hexString: "FF1378"))
    let prplNeon = GradientColor(start: Color(hexString: "FE019A"), end: Color(hexString: "FE0BF4"))
    let orngPink = GradientColor(start: Color(hexString: "FF8E2D"), end: Color(hexString: "FF4E7A"))
    
}

struct LaunchTheme {
    
}
