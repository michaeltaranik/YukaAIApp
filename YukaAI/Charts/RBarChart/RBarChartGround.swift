//
//  RBarChartGround.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.10.2024.
//

import SwiftUI

//struct CustLine: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: rect.width, y: 0))
//        return path
//    }
//}

struct RBarChartGround: View {
    var body: some View {
        ZStack {
            VStack(spacing: 100) {
                Rectangle()
                    .frame(width: .infinity, height: 1)
                Rectangle()
                    .frame(width: .infinity, height: 1)
                Rectangle()
                    .frame(width: .infinity, height: 1)
            }
            
            HStack (spacing: 15) {
                ForEach(0..<12) { _ in
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .frame(width: 15, height: 202)
                }
            }
        }
    }
}

#Preview {
    RBarChartGround()
        .foregroundStyle(.secondary)
        .padding()
}
