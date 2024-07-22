//
//  Tester.swift
//  YukaAI
//
//  Created by Michael Taranik on 20.07.2024.
//

import SwiftUI

struct FirstView: View {
    
    private var image: some View = ImageLoader.fetchImage()
//    private var dataManager = DataManager()
    @State var count = 0
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: SecondView()) {
                Text("Display Results!")
                    .frame(width: 200, height: 100)
                    .background(.lightGreen)
                    .foregroundColor(.darkGreen)
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    .font(.system(size: 25, weight: .semibold))
            }
        }
    }
}

#Preview {
    FirstView()
}
