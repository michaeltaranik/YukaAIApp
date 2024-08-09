//
//  ShowButtonIndicator.swift
//  YukaAI
//
//  Created by Michael Taranik on 09.08.2024.
//

import SwiftUI

struct SemiCircle: View {
    
    var colorFill: Color
    
    var body: some View {
        HalfCircle(_inset: 0)
            .fill(colorFill)
            .clipped()
            .aspectRatio(2, contentMode: .fit)
            .frame(width: 200)
            .rotationEffect(.degrees(180))
    }
}



struct HalfCircle: InsettableShape {
    var _inset: CGFloat = 0
    
    func inset(by amount: CGFloat) -> Self {
        var copy = self
        copy._inset += amount
        return copy
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // This is a half-circle centered at the origin with radius 1.
        path.addArc(
            center: .zero,
            radius: 1,
            startAngle: .zero,
            endAngle: .radians(.pi),
            clockwise: false
        )
        path.closeSubpath()
        
        // Since it's the bottom half of a circle, we only want
        // to inset the left, right, and bottom edges of rect.
        let rect = rect
            .insetBy(dx: _inset, dy: 0.5 * _inset)
            .offsetBy(dx: 0, dy: -(0.5 * _inset))
        
        // This transforms bounding box of the path to fill rect.
        let transform = CGAffineTransform.identity
            .translatedBy(x: rect.origin.x + 0.5 * rect.size.width, y: 0)
            .scaledBy(x: rect.width / 2, y: rect.height)
        
        return path.applying(transform)
    }
}

#Preview {
    SemiCircle(colorFill: .accent)
}
