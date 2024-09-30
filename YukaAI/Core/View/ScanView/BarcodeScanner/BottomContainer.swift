//
//  BottomContainer.swift
//  YukaAI
//
//  Created by Michael Taranik on 30.09.2024.
//

import Foundation
import SwiftUI
import Combine

extension BarcodeScannerView {
    
    var scanner: some View {
        DataScannerView(
            recognizedItems: $vm.recognizedItems,
            recognizedDataType: vm.recognizedDataType)
        .ignoresSafeArea(edges: .all)
        .background { Color.gray.opacity(0.3) }
        .id(vm.dataScannerViewId)
        .sheet(isPresented: $vm.showBottomContainer) {
            bottomContainerView
                .background(GreenGradient())
                .presentationDetents([.fraction(0.95), .fraction(0.25)])
                .presentationDragIndicator(.visible)
                .onAppear {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
                        return
                    }
                    controller.view.backgroundColor = .clear
                }
        }
        .onReceive(Just(vm.recognizedItems.count)) { newCount in
            if newCount != vm.previousCount {
                vm.handleOnChange(newCount)
                vm.previousCount = newCount
            }
        }
        .onChange(of: vm.showBottomContainer) { newValue in
            withAnimation {
                vm.recognized.toggle()
            }
        }
    }
    
    private var bottomContainerView: some View {
        @Binding var showBottomContainer: Bool
        let lastItem = vm.recognizedItems.count - 1
        let item = vm.recognizedItems[lastItem]
        return VStack {
            switch item {
            case .barcode(let barcode):
                ProductItemView(barcode: barcode.payloadStringValue ?? "")
            case .text(let text):
                Text(text.transcript)
            @unknown default:
                Text("Unknown")
            }
            
        }
    }
}
