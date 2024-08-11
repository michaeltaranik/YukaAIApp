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
    
    
    @StateObject private var vm = ViewModel()
    @StateObject private var cartVM = CartViewModel()
    
    var barcode: String
    

    @ViewBuilder
    var backgroundGradient: some View {
        switch vm.quality {
            
        case .good(color: _):
            LightGreenGradient()
            
        case .average(color: _):
            LightYellowGradient()
            
        case .bad(color: _):
            LightRedGradient()
            
        }
    }
    
    
    
    var body: some View {
        ZStack {
            backgroundGradient
            ScrollView {
                VStack {
                    HStack {
                        productImage
                        vm.productName == "Unknown" ? nil : headerInfo
                    }
                    .task {
                        await vm.getInfo(barcode: barcode)
                        vm.changeMacros()
                    }
                    .padding()
                    vm.productName == "Unknown" ? nil : descriptionLabel
                    Spacer()
                }
            }
            .alert(isPresented: $vm.shouldShowAlert) {
                Alert(title: Text("Our App does not support this product"),
                      message: Text("Please try another product"),
                      dismissButton: .default(Text("OK")))
            }
            if vm.isLoading {
                LoadingView()
            }
            
        }
    }
    
    
    
    var headerInfo: some View {
        VStack(alignment: .center, content: {
            Text(vm.productName)
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
            Text("\(vm.calories) kcal")
            Text("Carbs: \(vm.carbs) g")
            Text("Fats: \(vm.fats) g")
            Text("Proteins: \(vm.proteins) g")
            Text("Sugars: \(vm.sugars) g")
        }
        .font(.system(size: 18, weight: .semibold))
        .foregroundStyle(.darkGreen)
    }
    
    
    var nutriLabel: some View {
        let score = vm.nutriScore
        var color: Color {
            switch vm.quality {
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
        let imageURL = vm.imageUrlString
        
        return VStack(alignment: .leading) {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .frame(width: 150, height: 150)
                    .task {
                        cartVM.saveToCart(barcode, imageUrlString: imageURL, productName: vm.productName)
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

