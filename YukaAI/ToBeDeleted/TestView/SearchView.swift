//
//  SearchView.swift
//  YukaAI
//
//  Created by Michael Taranik on 21.07.2024.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") { 
                FirstView()
            }
        }
    }
}

#Preview {
    SearchView()
}
