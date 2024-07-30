//
//  BarcodeScannerView.swift
//  YukaAI
//
//  Created by Michael Taranik on 23.07.2024.
//

import SwiftUI
import VisionKit

struct BarcodeScannerView: View {
    
    @StateObject private var vm = BarcodeScannerViewModel()
    @EnvironmentObject var contentManager: ContentViewManager
    
    
    
    
    var body: some View {
        mainView
    }
    
    private var mainView: some View {
        DataScannerView(
            recognizedItems: $vm.recognizedItems,
            recognizedDataType: vm.recognizedDataType)
        .background { Color.gray.opacity(0.3) }
        .id(vm.dataScannerViewId)
        .sheet(isPresented: $vm.showBottomContainer) {
            bottomContainerView
                .background(GreenGradient())
                .presentationDetents([.medium, .fraction(0.25)])
                .presentationDragIndicator(.visible)
                .onAppear {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
                        return
                    }
                    controller.view.backgroundColor = .clear
                }
        }
        .onChange(of: vm.recognizedItems.count, {
            guard !vm.recognizedItems.isEmpty else { return }
            if !vm.showBottomContainer {
                vm.showBottomContainer.toggle()
            }
//            if vm.showNewProduct() {
//                if vm.showBottomContainer {
//                    vm.showBottomContainer = false
//                    vm.showBottomContainer.toggle()
//                }
//            }
        })
        .onChange(of: contentManager.mainTitle) { vm.recognizedItems = [] }
    }
    
    

    
    private var bottomContainerView: some View {
        @Binding var showBottomContainer: Bool
        let lastItem = vm.recognizedItems.count - 1
        let item = vm.recognizedItems[lastItem]
        print(lastItem)
        print(item)
        
        return VStack {
            switch item {
            case .barcode(let barcode):
                ScanView(barcode: barcode.payloadStringValue ?? "")
            case .text(let text):
                Text(text.transcript)
                
            @unknown default:
                Text("Unknown")
            }
            
        }
    }
}
