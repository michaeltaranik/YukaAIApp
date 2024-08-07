//
//  CreateUserView.swift
//  YukaAI
//
//  Created by Michael Taranik on 24.07.2024.
//

import SwiftUI

struct CreateUserView: View {
    let name: String
    let surname: String
    let sectionTitleSize = 26
    
    @State var age: Double = 18.0
    @State var height: Double = 170.0
    @State var weight: Double = 65.0
    @State var gender: String = "Male"
    
    @AppStorage("sign_in") var currentUserLoggedIn: Bool = false

    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .lightGreen], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            VStack {
                Text(name + " " + surname)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(.darkGreen)
                    .padding()
                Spacer()
                ageSlider
                    .padding(.top)
                Spacer()
                heightSlider
                    .padding(.top)
                Spacer()
                weightSlider
                    .padding(.top)
                Spacer()
                genderSection
                    .padding(.top)
                Spacer()
                Spacer()
                proceedButton
            }
        }
    }
    
    
    
    var ageSlider: some View {
        VStack {
            Text("Age: " + (String(format: "%.0f", age)) + " years")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: CGFloat(sectionTitleSize), weight: .bold))
                .foregroundStyle(.darkGreen)
                .padding(.horizontal)
            Slider(value: $age, in: 2...100, step: 1.0)
                .frame(width: 350)
                .tint(.darkGreen)
        }
    }
    
    var heightSlider: some View {
        VStack {
            Text("Height: " + (String(format: "%.0f", height)) + " cm")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: CGFloat(sectionTitleSize), weight: .bold))
                .foregroundStyle(.darkGreen)
                .padding(.horizontal)
            Slider(value: $height, in: 130...210, step: 1.0)
                .frame(width: 350)
                .tint(.darkGreen)
        }
    }
    
    var weightSlider: some View {
        VStack {
            Text("Weight: " + (String(format: "%.0f", weight)) + " kg")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: CGFloat(sectionTitleSize), weight: .bold))
                .foregroundStyle(.darkGreen)
                .padding(.horizontal)
            Slider(value: $weight, in: 10...150, step: 1.0)
                .frame(width: 350)
                .tint(.darkGreen)
        }
    }

    
    var genderSection: some View {
        VStack (alignment: .leading, content: {
            Text("Gender: " + gender)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: CGFloat(sectionTitleSize), weight: .bold))
                .foregroundStyle(.darkGreen)
                .padding(.horizontal)
            Picker("Select your Gender", selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
            }
            .frame(width: 350, height: 50)
            .shadow(radius: 5)
            .padding(.horizontal)
            .pickerStyle(.segmented)
        })
    }
   
    
    var proceedButton: some View {
        Button("Proceed") {
            self.currentUserLoggedIn = true
        }
        .frame(width: 300, height: 70)
        .font(.system(size: 24, weight: .semibold))
        .foregroundStyle(.darkGreen)
        .background(.lightGreen)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    CreateUserView(name: "Michael", surname: "Taranik")
}
