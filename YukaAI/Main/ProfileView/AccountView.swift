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
        ZStack {
            NavigationStack {
                List {
                    ProfileHeaderView(darkMode: $darkMode)
                    NavigationLink(
                        destination: ConnectionView()) {
                            AppleHealthSectionView(darkMode: $darkMode)
                        }
                    DarkModeSectionView(darkMode: $darkMode)
                    AppleHealthSectionView(darkMode: $darkMode)
                        .fullScreenCover(isPresented: $showHealth , content: {
                            HealthView(showHealthView: $showHealth)
                        })
                        .alert(
                            "Change your Privacy Rules in Settings",
                            isPresented: $showHealth) {}
                        .onTapGesture {
                            showHealth.toggle()
                        }
                }
                .navigationTitle(Text("Profile"))
                .background(.accentInverted)
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

