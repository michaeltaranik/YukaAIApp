//
//  CartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct CartView: View {
    
    //    var item = ProductItem(barcode: "5060947546363",
    //                           name: "Monster",
    //                           calories: "46",
    //                           imageUrl: "https://images.openfoodfacts.org/images/products/506/094/754/6363/front_en.12.400.jpg",
    //                           macros:
    //                            Macros(fat: "0.5",
    //                                   carbs: "10.0",
    //                                   protein: "0.0",
    //                                   fiber: "0.0",
    //                                   sugar: "9.5",
    //                                   salt: "nil"))
    //    var testarr: [ProductItem] { [item, item, item] }
    
    @StateObject var vm = CartViewModel()
    
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.products, id: \.self) { product in
                    NavigationLink(value: product) {
                        HStack {
                            productImage(product)
                            Text("\(product.name)")
                        }
                    }
                }
                .onDelete { indexSet in
                    vm.deleteFromCart(at: indexSet)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Cart")
            .navigationDestination(for: ProductItem.self) { product in
                ScanView(barcode: product.barcode)
            }
            .refreshable {
                vm.loadCart()
            }
            .toolbar {
                EditButton()
            }
        }
        .onAppear {
            vm.loadCart()
        }
    }
    
    
    
    fileprivate func productImage(_ product: ProductItem) -> AsyncImage<_ConditionalContent<some View, some View>> {
        return AsyncImage(url: URL(string: product.imageUrl)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(
                    RoundedRectangle(
                        cornerSize: CGSize(width: 10, height: 10)))
                .frame(width: 100, height: 80)
        } placeholder: {
            Image(.default)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(
                    RoundedRectangle(
                        cornerSize: CGSize(width: 10, height: 10)))
                .frame(width: 100, height: 80)
        }
    }
}


//
//#Preview {
//    CartView()
//}
