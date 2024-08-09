//
//  AccountView.swift
//  YukaAI
//
//  Created by Michael Taranik on 26.07.2024.
//

import SwiftUI


struct AccountView: View {
    @State var darkMode = false
    @State var showHealth = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.cyan
                    .ignoresSafeArea()
                List {
                    NavButtonView(
                        image: Image(systemName: "heart.fill"),
                        color: Color(.red),
                        label: "Connect Apple Health")
                    NavButtonView(
                        image: Image(systemName: "translate"),
                        color: Color(.orange),
                        label: "Language")
                    NavButtonView(
                        image: Image(systemName: "sun.max.fill"),
                        color: Color(.purple),
                        label: "Dark theme")
                    NavButtonView(
                        image: Image(systemName: "questionmark.circle.fill"),
                        color: Color(.darkGreen),
                        label: "Help")
                    NavButtonView(
                        image: Image(systemName: "person.crop.circle.badge.questionmark"),
                        color: Color(.cyan),
                        label: "Support")
                    NavButtonView(
                        image: Image(systemName: "eraser.line.dashed.fill"),
                        color: Color(.darkRed),
                        label: "Delete all data")
                }
                .scrollContentBackground(.hidden)
                .navigationTitle(Text("Profile"))
                //            .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    //
    //    List {
    //        ForEach(productList.list, id: \.self) { product in
    //            NavigationLink(value: product) {
    //                HStack {
    //                    AsyncImage(url: URL(string: product.imageUrl)) { image in
    //                        image
    //                            .resizable()
    //                            .aspectRatio(contentMode: .fit)
    //                            .clipShape(
    //                                RoundedRectangle(
    //                                    cornerSize: CGSize(width: 10, height: 10)))
    //                            .frame(width: 100, height: 80)
    //
    //                    } placeholder: {
    //                        Image(.default)
    //                            .resizable()
    //                            .aspectRatio(contentMode: .fit)
    //                            .clipShape(
    //                                RoundedRectangle(
    //                                    cornerSize: CGSize(width: 10, height: 10)))
    //                            .frame(width: 100, height: 80)
    //                    }
    //                    Text("\(product.name)")
    //                }
    //            }
    //        }
    //    }
    //    .listStyle(.insetGrouped)
    //    .navigationTitle("Cart")
    //    .navigationDestination(for: ProductItem.self) { product in
    //        ScanView(barcode: product.barcode)
    //    }
    //    .refreshable {
    //    }
}

#Preview {
    AccountView()
}

