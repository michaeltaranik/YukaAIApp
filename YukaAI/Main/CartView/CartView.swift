//
//  CartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct CartView: View {
    
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
        .foregroundColor(.accent)
        .background(.accentInverted)
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



#Preview {
    CartView()
}
