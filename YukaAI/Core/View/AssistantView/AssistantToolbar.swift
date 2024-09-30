//
//  AssistantToolbar.swift
//  YukaAI
//
//  Created by Michael Taranik on 14.08.2024.
//

import SwiftUI

struct AssistantToolbar: ToolbarContent {
    
    let onProfileTap: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem {
            AssistantToolbarTrailingContent(onProfileTap: onProfileTap)
        }
    }
}

fileprivate struct AssistantToolbarTrailingContent: View {
    
    let onProfileTap: () -> Void
    
    var body: some View {
        Button {
            onProfileTap()
        } label: {
            Label("Profile", systemImage: "person.crop.circle")
        }

    }

}
