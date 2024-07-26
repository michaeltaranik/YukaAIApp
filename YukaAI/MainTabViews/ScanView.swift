//
//  ScanView.swift
//  YukaAI
//
//  Created by Michael Taranik on 21.07.2024.
//

import SwiftUI

struct ScanView: View {
    
    var barcode: String
    
    
    @EnvironmentObject var productList: ProductList
    @StateObject private var vm = ProductViewModel()
    @StateObject private var dataManager = DataManager()
    @StateObject private var scanResultsModel = ScanResultsModel()
    
    @State var isLoading = false
    
    @State private var image: UIImage?
    @State private var productName = "Product"
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
                    HStack {
                        productImage
                        headerInfo
                    }
                    .padding()
                    Spacer()
                    HStack {
                        Image(systemName: vm.icon)
                        Text(vm.text)
                    }
                    .frame(width: 150, height: 70)
                    .background(vm.backColor)
                    .foregroundColor(vm.foreColor)
                    .font(.system(size: 25, weight: .semibold))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(30)
                    .task {
                        await scanResultsModel.getInfo(barcode: barcode)
                        self.changeMacros(scanResultsModel.results)
                        vm.approveButton(approve: true)
                    }
                    .onTapGesture {
                        
                    }
                }
            }
            if scanResultsModel.isLoading {
                LoadingView()
            }
        }
    }
    
    var productImage: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: scanResultsModel.results?.product?.image_url ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .frame(width: 150, height: 150)
            } placeholder: {
                Image(.default)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .frame(width: 150, height: 150)
            }
        }
    }
    
    var headerInfo: some View {
        VStack(alignment: .leading, content: {
            Text(productName)
            Text("Calories: " + calories)
            Text("Carbs: " + carbs)
            Text("Fats: " + fats)
            Text("Proteins: " + proteins)
            Text("Sugars: " + sugars)
        })
        .font(.system(size: 18, weight: .semibold))
        .foregroundStyle(.darkGreen)
    }
}


extension ScanView {
    func changeMacros(_ results: Results?) {
        self.productName = results?.product?.product_name ?? "unknown"
        let roundedCal = ((results?.product?.nutriments.energy_value ?? 0.0) / 4.184).rounded()
        self.calories = String(roundedCal)
        self.carbs = String(results?.product?.nutriments.carbohydrates_100g ?? 0.0)
        self.proteins = String(results?.product?.nutriments.proteins_100g ?? 0.0)
        self.fats = String(results?.product?.nutriments.fat_100g ?? 0.0)
        self.sugars = String(results?.product?.nutriments.sugars_100g ?? 0.0)
        self.image = scanResultsModel.image
        productList.list.append(
            ProductItem(name: productName,
                        calories: calories,
                        image: image ?? .default,
                        macros: Macros(fat: fats, carbs: carbs, protein: proteins, fiber: "nil", sugar: sugars, salt: "nil")))
    }
}


//
//#Preview {
//    ScanView(barcode: "3045140105502")
//}

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
