//
//  CartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var productList: ProductList
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(productList.list, id: \.self) { product in
                        HStack {
                            Image(uiImage: product.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                .frame(width: 150, height: 150)
                            Text("Click me \(product.name)")
                        }
                    }
                }
            }
            .navigationTitle("Cart")
            
        }
    }
}

//#Preview {
//    CartView()
//}
