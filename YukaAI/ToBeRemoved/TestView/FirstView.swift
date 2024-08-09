//
//  Tester.swift
//  YukaAI
//
//  Created by Michael Taranik on 20.07.2024.
//

import SwiftUI

struct FirstView: View {
    
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .padding(30)
            HalfCircle(_inset: 0)
                .fill(.black)
                .clipped()
                .aspectRatio(2, contentMode: .fit)
                .frame(width: 200)
                .onTapGesture {
                    count += 1
                }
        }
    }
}

#Preview {
    FirstView()
}
