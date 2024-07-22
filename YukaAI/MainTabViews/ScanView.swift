//
//  ScanView.swift
//  YukaAI
//
//  Created by Michael Taranik on 21.07.2024.
//

import SwiftUI

struct ScanView: View {
    
    private var products = [
        "20724696",
        "3045140105502",
        "4056489216162",
        "5000157024855",
        "8410076801197",
        "5013665108801"
    ]
    
    
    @StateObject private var vm = ProductViewModel()
    @StateObject private var dataManager = DataManager()
    
    @State var isLoading = false
    
    @State private var image: UIImage?
    @State private var calories = "0.0"
    @State private var carbs = "0.0"
    @State private var fats = "0.0"
    @State private var proteins = "0.0"
    @State private var sugars = "0.0"
    
    
    
    
    var body: some View {
        ZStack {
            Color(.lightGreen)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Image(uiImage: image ?? UIImage(named: "default")!)
                        .resizable()
                        .scaledToFit()
                    HStack {
                        Spacer()
                        VStack(alignment: .leading, content: {
                            Text("Calories: " + calories)
                            Text("Carbs: " + carbs)
                            Text("Fats: " + fats)
                            Text("Proteins: " + proteins)
                            Text("Sugars: " + sugars)
                        })
                        .font(.system(size: 30, weight: .semibold))
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Image(systemName: vm.icon)
                        Text(vm.text)
                    }
                    .frame(width: 200, height: 100)
                    .background(vm.backColor)
                    .foregroundColor(vm.foreColor)
                    .font(.system(size: 25, weight: .semibold))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .onTapGesture {
                        
                        isLoading = true
                        DispatchQueue.main.async {
                            dataManager.fetchData(barcode: products.randomElement()!)
                        }
                        if let safeResults = dataManager.results {
                            self.changeMacros(safeResults)
                            if let urlString = safeResults.product?.image_url {
                                if let url = URL(string: urlString) {
                                    if let safeData = try? Data(contentsOf: url) {
                                        let newImage = UIImage(data: safeData)
                                        self.image = newImage
                                    }
                                }
                            }
                            vm.approveButton(approve: true)
                        } else {
                            vm.approveButton(approve: false)
                        }
                        isLoading = false
                    }
                    .symbolEffect(.pulse, value: vm.animate)
                }
                if isLoading {
                    LoadingView()
                }
            }
            }
    }
}


extension ScanView {
    func changeMacros(_ results: Results) {
        let roundedCal = ((results.product?.nutriments.energy_value ?? 0.0) / 4.184).rounded()
        self.calories = String(roundedCal)
        self.carbs = String(results.product?.nutriments.carbohydrates_100g ?? 0.0)
        self.proteins = String(results.product?.nutriments.proteins_100g ?? 0.0)
        self.fats = String(results.product?.nutriments.fat_100g ?? 0.0)
        self.sugars = String(results.product?.nutriments.sugars_100g ?? 0.0)
    }
}



#Preview {
    ScanView()
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.lightGreen)
                .ignoresSafeArea()
                .opacity(0.8)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .darkGreen ))
                .scaleEffect(3)
                .background(.lightGreen)
        }
        
    }
}
