//
//  ProfileView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(.lightGreen)
                .ignoresSafeArea()
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.darkGreen)
                    .padding()
                Text("Your Profile!")
                    .bold()
            }
        }
    }
}

#Preview {
    ProfileView()
}
