//
//  GeometryEffect.swift
//  YukaAI
//
//  Created by Michael Taranik on 05.08.2024.
//

import SwiftUI

struct GeometryEffect: View {
    
    private var tabs = ["Home", "Profile", "Settings"]
    @State private var selectedTab = ""
    
    @Namespace private var animation
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                ZStack {
                    if selectedTab == tab {
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            .fill(Color.blue)
                            .matchedGeometryEffect(id: "animatable", in: animation)
                            .frame(width: 170, height: 100)
                    }
                    Text(tab)
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .onTapGesture {
                            withAnimation(.spring) {
                                selectedTab = tab
                            }
                        }
                }
            }
        }
        
        
    }
}

#Preview {
    GeometryEffect()
}
