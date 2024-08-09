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
            //            GreenGradient()
            NavigationStack {
                List {
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
                        .listRowBackground(Color(.lightRed))
                }
                .navigationTitle(Text("Profile"))
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
        HStack {
            Image(.avatarIcon)
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 10)
                .frame(width: 150, height: 150)
                .foregroundColor(!darkMode ? .darkGreen : .lightGreen)
                .padding(.vertical)
            
            Text("Your Profile!")
                .foregroundColor(!darkMode ? .darkGreen : .lightGreen)
                .bold()
                .padding()
        }
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
