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
        case 0...3 :
            Color(.lightRed)
        case 7...10:
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
            Text("\(score) / 10")
                .bold()
                .foregroundStyle(.black)
        }
    }
}



#Preview {
    NutriLabelView(score: 10)
}
