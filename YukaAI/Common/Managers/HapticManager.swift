//
//  HapticManager.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.08.2024.
//

import UIKit

class HapticManager {

    static let shared = HapticManager(); private init() {}
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
