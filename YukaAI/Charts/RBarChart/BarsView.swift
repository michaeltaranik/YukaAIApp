//
//  BarsView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.10.2024.
//

import SwiftUI

struct BarsView: View {
    
    var data: [Double]
    var maxValue: Double = 10
    var width: CGFloat = UIScreen.screenWidth/10
    var height: CGFloat = UIScreen.screenHeight/5
    var barSpacing: CGFloat = 10
    var barWidth: CGFloat = 20
    var color: Color = .cyan
    
    var body: some View {
        HStack(alignment: .bottom, spacing: barSpacing) {
            ForEach(data, id: \.self) { bar in
                    SingleBarView(
                        maxHeight: height,
                        maxValue: maxValue,
                        value: bar,
                        width: barWidth,
                        color: color)
            }
        }
    }
}

#Preview {
    BarsView(data: [2, 2, 7, 4, 5, 6, 7, 8, 9, 10])
}
