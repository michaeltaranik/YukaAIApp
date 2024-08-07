//
//  ProfileView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI


struct ProfileView: View {
    @State var darkMode = false
    @State var showHealth = false
    
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    ProfileHeaderView(darkMode: $darkMode)
                    NavigationLink(
                        destination: ConnectionView()) {
                            AppleHealthSectionView(darkMode: $darkMode)
                        }
                    DarkModeSectionView(darkMode: $darkMode)
                    AppleHealthSectionView(darkMode: $darkMode)
                        .fullScreenCover(isPresented: $showHealth , content: {
                            HealthView(showHealthView: $showHealth)
                        })
                        .alert(
                            "Change your Privacy Rules in Settings",
                            isPresented: $showHealth) {}
                        .onTapGesture {
                            showHealth.toggle()
                        }
                }
                .navigationTitle(Text("Profile"))
                .background(darkMode ? .darkGreen : .lightGreen)
            }
        }
    }
    
    
}

#Preview {
    ProfileView()
}

struct ProfileHeaderView: View {
    @Binding var darkMode: Bool
    
    var body: some View {
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 200, height: 200)
            .foregroundColor(!darkMode ? .darkGreen : .lightGreen)
            .padding()
        Text("Your Profile!")
            .foregroundColor(!darkMode ? .darkGreen : .lightGreen)
            .bold()
    }
}

struct DarkModeSectionView: View {
    @Binding var darkMode: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(darkMode ? .black : .white)
                .cornerRadius(10)
                .frame(height: 40)
            Toggle(isOn: $darkMode, label: {
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .cornerRadius(6.0)
                            .foregroundStyle(!darkMode ? .darkBlue : .lightRed)
                        Image(systemName: darkMode ? "sun.max.fill" : "moon.stars.fill")
                            .foregroundStyle(!darkMode ? .white : .black)
                    }
                    Text("Dark Mode")
                        .foregroundColor(!darkMode ? .darkGreen : .lightGreen)
                }
            })
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}


struct AppleHealthSectionView: View {
    @Binding var darkMode: Bool
    
    var body: some View {
        ZStack (alignment: .leading, content: {
            Rectangle()
                .foregroundStyle(darkMode ? .black : .white)
                .cornerRadius(10)
                .frame(height: 40)
            HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .cornerRadius(6.0)
                            .foregroundStyle(!darkMode ? .red : .lightRed)
                        Image(systemName: "heart.fill")
                            .foregroundStyle(!darkMode ? .white : .black)
                    }
                    Text("Connect Apple Health")
                        .foregroundColor(!darkMode ? .black : .white)
                }
            .padding(.horizontal)
        })
        .padding(.horizontal)
    }
}
