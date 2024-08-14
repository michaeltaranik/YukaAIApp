//
//  NutriLabelView.swift
//  YukaAI
//
//  Created by Michael Taranik on 11.08.2024.
//

import SwiftUI

struct NutriLabelView: View {
    
    let score: Int
    
    var color: Color {
        switch score {
        case 0...30 :
            Color(.lightRed)
        case 31...69:
            Color(.lightYellow)
        case 70...100:
            Color(.lightGreen)
        default:
            Color(.lightYellow)
        }
    }
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                .foregroundStyle(color)
                .frame(width: 90, height: 25)
                .shadow(color: color, radius: 3)
            Text("\(score) / 100")
                .bold()
                .foregroundStyle(.black)
        }
    }
}



#Preview {
    NutriLabelView(score: 69)
}
