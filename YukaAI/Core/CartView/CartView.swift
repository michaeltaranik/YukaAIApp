//
//  CartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct CartView: View {
    
    @StateObject private var vm = CartViewModel()
        
    
    var body: some View {
        NavigationStack {
            CartListView(vm: vm)
        }
        .foregroundColor(.accentColor)
        .onAppear {
            vm.loadCart()
        }
    }
    
    
}



#Preview {
    CartView()
}

struct CartListView: View {
    
    @StateObject var vm: CartViewModel
    
    
    var body: some View {
        ZStack {
            
            background
            
            List {
                ForEach(vm.products, id: \.self) { product in
                    NavigationLink(value: product) {
                        HStack {
                            productImage(product)
                            VStack(alignment: .leading) {
                                Text("\(product.name)")
                                    .bold()
                                NutriLabelView(score: product.nutriscore)
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    vm.deleteFromCart(at: indexSet)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
            .navigationTitle("Cart")
            .navigationDestination(for: ProductItem.self) { product in
                ScanView(barcode: product.barcode)
                    .toolbar(.hidden, for: .tabBar)
            }
            .refreshable {
                vm.loadCart()
            }
//            .toolbar(vm.isEditing ? .hidden : .visible, for: .tabBar)
            .toolbar {
                EditButton()
//                    .onTapGesture {
//                        withAnimation {
//                            vm.isEditing.toggle()
//                        }
//                    }
            }
        }
    }
    
    
    
    
}

extension CartListView {
    
    var background: some View {
        Color(.accentBack)
            .ignoresSafeArea(.all)
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




