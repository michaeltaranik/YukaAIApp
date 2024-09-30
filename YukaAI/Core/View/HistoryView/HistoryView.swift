//
//  CartView.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import SwiftUI

struct HistoryView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var cart: CartViewModel
    
    var body: some View {
        NavigationStack {
            HistoryListView(vm: cart)
                .toolbar { dismissButton }
        }
        .foregroundColor(.accentColor)
        .onAppear {
            cart.loadCart()
        }
    }
}

#Preview {
    HistoryView()
        .environmentObject(CartViewModel())
}

extension HistoryView {
    var dismissButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                HapticManager.shared.impact(style: .medium)
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .bold()
                    .font(.headline)
            }
        }
    }
}

struct HistoryListView: View {
    
    @StateObject var vm: CartViewModel
    @State private var searchText: String = ""
    @State private var showOptions: Bool = false
    
    var body: some View {
        ZStack {
            background
            VStack {
                if searchResults.isEmpty {
                    VStack {
                        Spacer()
                        Text("No products found")
                            .font(.title)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                else {
                    cartList
                        .scrollContentBackground(.hidden)
                        .listStyle(.insetGrouped)
                        .navigationDestination(for: ProductItem.self) { product in
                            ProductItemView(barcode: product.barcode)
                                .toolbar(.hidden, for: .tabBar)
                        }
                        .refreshable {
                            vm.loadCart()
                        }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("History")
            .toolbar {
                
            }
//            addButton
                
        }
    }
    
    var cartList: some View {
        List {
            ForEach(searchResults, id: \.self) { product in
                NavigationLink(value: product) {
                    HStack {
                        productImage(product)
                        VStack(alignment: .leading) {
                            Text("\(product.genericName)")
                                .bold()
                            NutriLabelView(score: product.nutriscore ?? 0)
                        }
                    }
                }
            }
        }
    }
    
    var addButton: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                AddButtonView(showOptions: $showOptions, size: 60)
                    .padding(.trailing, 30)
                    .padding(.bottom, 30)
            }
        }
    }
}





extension HistoryListView {
    
    var searchResults: [ProductItem] {
        if searchText.isEmpty {
            return vm.products
        } else {
            let searchText = searchText.lowercased(with: .current)
            return vm.products.filter { item in
                let name = item.genericName.lowercased()
                return name.contains(searchText)
            }
        }
    }
    
    
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




