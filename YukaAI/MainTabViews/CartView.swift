//
//  CartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct CartView: View {
    
    //    @EnvironmentObject var productList: ProductList
    var item = ProductItem(barcode: "5060947546363",
                           name: "Monster",
                           calories: "46",
                           imageUrl: "",
                           macros:
                            Macros(fat: "0.5",
                                   carbs: "10.0",
                                   protein: "0.0",
                                   fiber: "0.0",
                                   sugar: "9.5",
                                   salt: "nil"))
    var testarr: [ProductItem] { [item, item, item, item] }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(testarr, id: \.self) { product in
                    NavigationLink(value: product) {
                        HStack {
                            AsyncImage(url: URL(string: product.imageUrl)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerSize: CGSize(width: 10, height: 10)))
                                    .frame(width: 100, height: 150)
                            } placeholder: {
                                Image(.default)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerSize: CGSize(width: 10, height: 10)))
                                    .frame(width: 150, height: 150)
                            }
                            Text("\(product.name)")
                        }
                        
                    }
                }
            }
            .navigationTitle("Cart")
            .navigationDestination(for: ProductItem.self) { product in
                ScanView(barcode: product.barcode)
            }
        }
    }
}


#Preview {
    CartView()
}
