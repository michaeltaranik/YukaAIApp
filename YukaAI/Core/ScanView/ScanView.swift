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
                    HStack {
                        nutrients
                            .padding()
                        Spacer()
                    }
                    HStack {
                        additives
                            .foregroundColor(.darkGreen)

                        Spacer()
                    }
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
    var nutrients: some View {
        if let item = vm.productItem {
            
            let cal = item.energy.first
            if cal != "0" {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("Nutrients:")
                    }
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Calories:")
                            Text(String(item.energy))
                                .bold()
                        }
                        .font(.subheadline)
                        HStack {
                            Text("Carbs:")
                            Text(String(item.carbohydrates))
                                .bold()
                        }
                        .font(.subheadline)
                        HStack {
                            Text("Fats:")
                            Text(String(item.fat))
                                .bold()
                        }
                        .font(.subheadline)
                        HStack {
                            Text("Proteins:")
                            Text(String(item.protein))
                                .bold()
                        }
                        .font(.subheadline)
                        HStack {
                            Text("Fiber:")
                            Text(String(item.fiber))
                                .bold()
                        }
                        .font(.subheadline)
                    }
                    .padding(.horizontal)
                }
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundStyle(.darkGreen)
            } else {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                        Text("No calories")
                    }
                }
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .foregroundStyle(.darkGreen)
            }
        }
    }
    
    @ViewBuilder
    var additives: some View {
        if let item = vm.productItem {
            
            if item.additivesTags.count > 0 {
                let tags = item.additivesTags.map { string in
                    let trimmed = String(string.dropFirst(3))
                    print(trimmed)
                    return trimmed.capitalized
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "exclamationmark.magnifyingglass")
                        Text("Additives:")
                    }
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .padding(.leading)
                    VStack(alignment: .leading) {
                        ForEach(tags, id: \.self) { additiveTag in
                            DisclosureGroup(additiveTag) {
                                VStack(alignment: .leading) {
                                    Text(K.additives[additiveTag]?.name ?? "")
                                    Text("Description: \(K.additives[additiveTag]?.description ?? "")")
                                        .font(.subheadline)
                                }
                                .padding(.horizontal)
                            }
                            .padding(.horizontal, 40)
                        }
                    }
                }
            } else {
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                    Text("No additives")
                }
                .font(.system(size: 24, weight: .semibold, design: .rounded))
            }
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
    ScanView(barcode: "7613404550571")
}

