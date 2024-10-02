//
//  CameraZoneFrameView.swift
//  YukaAI
//
//  Created by Michael Taranik on 01.10.2024.
//

import SwiftUI

struct CameraZoneFrameView: View {
    
    @Binding var recognized: Bool
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .stroke(recognized ? .greenish : .white,
                    lineWidth: recognized ? 10 : 2)
            .frame(width: 300, height: 300)
    }
}

#Preview {
    Group {
        CameraZoneFrameView(recognized: .constant(true))
            .padding(.vertical)
        CameraZoneFrameView(recognized: .constant(false))
    }
}
