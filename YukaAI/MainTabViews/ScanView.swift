//
//  ScanView.swift
//  YukaAI
//
//  Created by Michael Taranik on 21.07.2024.
//

import SwiftUI


enum ProductQuality {
    case good (color: Color)
    case average (color: Color)
    case bad (color: Color)
}


struct ScanView: View {
    
    
    @EnvironmentObject var productList: ProductList
    @StateObject private var viewModel = ViewModel()
    
    var barcode: String
    

    
    var body: some View {
        ZStack {
            LightGreenGradient()
            ScrollView {
                VStack {
                    HStack {
                        productImage
                        viewModel.productName == "Unknown" ? nil : headerInfo
                    }
                    .task {
                        await viewModel.getInfo(barcode: barcode)
                        viewModel.changeMacros()
                    }
                    .padding()
                    viewModel.productName == "Unknown" ? nil : descriptionLabel
                    Spacer()
                }
            }
            .alert(isPresented: $viewModel.shouldShowAlert) {
                Alert(title: Text("Our App does not support this product"),
                      message: Text("Please try another product"),
                      dismissButton: .default(Text("OK")))
            }
            if viewModel.isLoading {
                LoadingView()
            }
            
        }
    }
    
    
    
    var headerInfo: some View {
        VStack(alignment: .center, content: {
            Text(viewModel.productName)
                .font(.system(size: 28, weight: .bold))
            nutriLabel
                .padding(.horizontal)
                .padding(.bottom)
        })
        .font(.system(size: 19, weight: .semibold))
        .foregroundStyle(.darkGreen)
    }
    
    var descriptionLabel: some View {
        VStack {
            Text("\(viewModel.calories) kcal")
            Text("Carbs: \(viewModel.carbs) g")
            Text("Fats: \(viewModel.fats) g")
            Text("Proteins: \(viewModel.proteins) g")
            Text("Sugars: \(viewModel.sugars) g")
        }
        .font(.system(size: 18, weight: .semibold))
        .foregroundStyle(.darkGreen)
    }
    
    
    var nutriLabel: some View {
        let score = viewModel.nutriScore
        var color: Color {
            switch viewModel.quality {
            case .good(let color):
                color
            case .average(let color):
                color
            case .bad(let color):
                color
            }
        }
        return ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                .foregroundStyle(color)
                .frame(width: 90, height: 25)
            Text("\(score) / 100")
                .foregroundStyle(.black)
        }
    }
    
    
    
    var productImage: some View {
        let imageURL = viewModel.imageUrlString
        
        return VStack(alignment: .leading) {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .frame(width: 150, height: 150)
                    .task {
                        viewModel.addToCart(barcode, productList: productList, imageUrl: imageURL)
                    }
            } placeholder: {
                Image(.default)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .frame(width: 150, height: 150)
            }
        }
    }
    
    
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


#Preview {
    ScanView(barcode: "3045140105502")
}

