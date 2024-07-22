//
//  ScanView.swift
//  YukaAI
//
//  Created by Michael Taranik on 21.07.2024.
//

import SwiftUI

struct ScanView: View {
    
    @StateObject private var vm = ProductViewModel()
    @StateObject private var dataManager = DataManager()
    
    @State var isLoading = false
    
    @State private var image: UIImage?
    @State private var carbs = "0.0"
    @State private var fats = "0.0"
    @State private var proteins = "0.0"
    @State private var sugars = "0.0"
    
    var body: some View {
        ZStack {
            Color(.lightGreen)
                .ignoresSafeArea()
            VStack {
                Image(uiImage: image ?? UIImage(named: "default")!)
                    .resizable()
                    .scaledToFit()
                HStack {
                    Spacer()
                    VStack(alignment: .leading, content: {
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
                    Text("Display Results!")
                }
                .frame(width: 200, height: 100)
                .background(.lightGreen)
                .foregroundColor(.darkGreen)
                .font(.system(size: 25, weight: .semibold))
                .cornerRadius(20)
                .shadow(radius: 10)
                .onTapGesture {
                    isLoading = true
                    vm.approveButton(approve: true)
                    DispatchQueue.main.async {
                        dataManager.fetchData(barcode: "3045140105502")
                        let results = dataManager.results
                        self.carbs = String(results?.product?.nutriments.carbohydrates_100g ?? 0.0)
                        self.proteins = String(results?.product?.nutriments.proteins_100g ?? 0.0)
                        self.fats = String(results?.product?.nutriments.fat_100g ?? 0.0)
                        self.sugars = String(results?.product?.nutriments.sugars_100g ?? 0.0)
                        if let urlString = results?.product?.image_url {
                            if let url = URL(string: urlString) {
                                if let safeData = try? Data(contentsOf: url) {
                                    let newImage = UIImage(data: safeData)
                                    self.image = newImage
                                    isLoading = false
                                }
                            }
                        }
                    }
                }
                .symbolEffect(.pulse, value: vm.animate)
            }
            if isLoading {
                LoadingView()
            }
        }
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
