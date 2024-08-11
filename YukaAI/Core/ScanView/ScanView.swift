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
//            backgroundGradient
            ScrollView {
                VStack {
                    HStack {
//                        productImage
//                        if (vm.results?.product?.productName != "Unknown") {
//                            headerInfo
//                        }
                            
                    }
                    .task {
                        await vm.getInfo(barcode: barcode)
//                        vm.changeMacros()
                    }
                    .padding()
//                    if (vm.results?.product?.productName != "Unknown") {
//                        descriptionLabel
//                    }
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
    
    
    
//    var headerInfo: some View {
//        VStack(alignment: .center, content: {
//            Text(vm.results?.product?.productName ?? "")
//                .font(.system(size: 28, weight: .bold, design: .rounded))
//            NutriLabelView(score: vm.nutriScore)
//                .padding(.horizontal)
//                .padding(.bottom)
//        })
//        .font(.system(size: 19, weight: .semibold, design: .rounded))
//        .foregroundStyle(.darkGreen)
//    }
    
//    var descriptionLabel: some View {
//        VStack {
//            Text("\(vm.calories) kcal")
//            Text("Carbs: \(vm.carbs) g")
//            Text("Fats: \(vm.fats) g")
//            Text("Proteins: \(vm.proteins) g")
//            Text("Sugars: \(vm.sugars) g")
//        }
//        .font(.system(size: 18, weight: .semibold, design: .rounded))
//        .foregroundStyle(.darkGreen)
//    }
    
    
    
//    var productImage: some View {
//        let imageURL = vm.imageUrlString
//        
//        return VStack(alignment: .leading) {
//            AsyncImage(url: URL(string: imageURL)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
//                    .frame(width: 150, height: 150)
//                    .task {
//                        cartVM.saveToCart(
//                            barcode,
//                            imageUrlString: imageURL,
//                            productName: vm.productName,
//                            nutriscore: vm.nutriScore)
//                    }
//            } placeholder: {
//                Image(.default)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
//                    .frame(width: 150, height: 150)
//            }
//        }
//    }
    
    
//    
//    @ViewBuilder
//    var backgroundGradient: some View {
//        switch vm.quality {
//            
//        case .good(color: _):
//            LightGreenGradient()
//            
//        case .average(color: _):
//            LightYellowGradient()
//            
//        case .bad(color: _):
//            LightRedGradient()
//            
//        }
//    }
    
    
}



#Preview {
    ScanView(barcode: "3045140105502")
}

