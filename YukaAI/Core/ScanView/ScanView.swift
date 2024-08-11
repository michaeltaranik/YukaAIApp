//
//  ScanView.swift
//  YukaAI
//
//  Created by Michael Taranik on 21.07.2024.
//

import SwiftUI


struct ScanView: View {
    
    @StateObject private var vm = ViewModel()
    @StateObject private var cartVM = CartViewModel()
    
    var barcode: String
    
    
    var body: some View {
        ZStack {
            backgroundGradient
            ScrollView {
                VStack {
                    HStack {
                        productImage
                        headerInfo
                        
                    }
                    .task {
                        await vm.getInfo(barcode: barcode)
                    }
                    .padding()
                    descriptionLabel
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
    
    
    @ViewBuilder
    var headerInfo: some View {
        if let item = vm.productItem {
            VStack(alignment: .center, content: {
                Text(item.genericName)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                NutriLabelView(score: vm.productItem?.nutriscore ?? 0)
                    .padding(.horizontal)
                    .padding(.bottom)
            })
            .font(.system(size: 19, weight: .semibold, design: .rounded))
            .foregroundStyle(.darkGreen)
        }
    }
    
    
    @ViewBuilder
    var descriptionLabel: some View {
        if let item = vm.productItem {
            VStack {
                Text("\(item.energy)")
                Text("Carbs: \(item.carbohydrates)")
                Text("Fats: \(item.fat)")
                Text("Proteins: \(item.protein)")
                Text("Sugars: \(item.sugar)")
            }
            .font(.system(size: 18, weight: .semibold, design: .rounded))
            .foregroundStyle(.darkGreen)
        }
    }
    
    
    
    var productImage: some View {
        let imageURL = vm.productItem?.imageUrl ?? ""
        
        return VStack(alignment: .leading) {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .frame(width: 150, height: 150)
                    .task {
                        if let item = vm.productItem {
                            cartVM.saveToCart(product: item)
                        }
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
    
    
    
    @ViewBuilder
    var backgroundGradient: some View {
        
        if let score = vm.productItem?.nutriscore {
            switch score {
                
            case 70...100:
                LightGreenGradient()
                
            case 0...30:
                LightRedGradient()
                
            default:
                LightYellowGradient()
            }
        } else {
            LightRedGradient()
        }
        
    }
    
    
}



#Preview {
    ScanView(barcode: "3045140105502")
}

