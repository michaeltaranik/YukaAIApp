//
//  TestProfile.swift
//  YukaAI
//
//  Created by Michael Taranik on 09.08.2024.
//

import SwiftUI



struct TestProfile: View {
    @State private var isDarkThemeEnabled = true
    
    var body: some View {
        VStack {
            // Profile header
            VStack(alignment: .leading, spacing: 16) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
                    .padding(.leading)
                
                // Profile details
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.leading)
                    
                    VStack(alignment: .leading) {
                        Text("First Last")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Personal details")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
            }
            .padding(.top)
            
            // Options list
            List {
                // Connect Apple Health
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Text("Connect Apple Health")
                }
                
                // Language
                HStack {
                    Image(systemName: "globe")
                        .foregroundColor(.orange)
                    Text("Language")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                
                // Dark Theme
                HStack {
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.blue)
                    Text("Dark theme")
                    Spacer()
                    Toggle("", isOn: $isDarkThemeEnabled)
                        .labelsHidden()
                }
                
                // Help
                HStack {
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Help")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                
                // Support
                HStack {
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.blue)
                    Text("Support")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                
                // Delete all data
                HStack {
                    Image(systemName: "trash.fill")
                        .foregroundColor(.blue)
                    Text("Delete all data")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                
                // Log out
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                        .foregroundColor(.red)
                    Text("Log out")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .padding(.top)
            
            Spacer()
            
            // Version info
            Text("version: a1.0")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
            
            // Bottom Tab Bar
            HStack {
                Spacer()
                Image(systemName: "cart.fill")
                Spacer()
                Image(systemName: "star.fill")
                Spacer()
                Image(systemName: "camera.fill")
                    .font(.system(size: 40))
                    .background(Circle().fill(Color.green))
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                Image(systemName: "wand.and.stars")
                Spacer()
                Image(systemName: "person.fill")
            }
            .padding(.horizontal)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 2)
        }
        .background(Color(UIColor.systemGreen).opacity(0.1))
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    TestProfile()
}
