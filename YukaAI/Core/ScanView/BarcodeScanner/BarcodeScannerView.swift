//
//  BarcodeScannerView.swift
//  YukaAI
//
//  Created by Michael Taranik on 23.07.2024.
//

import SwiftUI
import VisionKit
import Combine

struct BarcodeScannerView: View {
    
    @StateObject private var vm = BarcodeScannerViewModel()
    @EnvironmentObject var contentManager: HomeViewManager
    
    
    var body: some View {
        ZStack {
            scanner
            barcodeFrame
                .ignoresSafeArea(.all)
            flashlight
                .padding(20)
            
        }
    }
    
    
    var barcodeFrame: some View {
        ZStack {
            Color.black.opacity(0.55)
                .mask {
                    Rectangle()
                        .cornerRadius(20)
                        .overlay(
                            Rectangle()
                                .frame(width: 300, height: 300)
                                .cornerRadius(20)
                                .blendMode(.destinationOut)
                        )
                }
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .stroke(vm.recognized ? .greenish : .white,
                        lineWidth: vm.recognized ? 10 : 2)
                .frame(width: 300, height: 300)
        }
    }
    
    
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
                ScanView(barcode: barcode.payloadStringValue ?? "")
            case .text(let text):
                Text(text.transcript)
                
            @unknown default:
                Text("Unknown")
            }
            
        }
    }
}



extension BarcodeScannerView {
    
    
    var flashlight: some View {
        HStack {
            VStack {
                flashButton()
                Spacer()
            }
            Spacer()
        }
    }
    
    
    
    @ViewBuilder
    private func flashButton() -> some View {
        Button {
            vm.isFlashOn.toggle()
            vm.toggleTorch(on: vm.isFlashOn)
            HapticManager.shared.impact(style: .light)
        } label: {
            Image(systemName: !vm.isFlashOn ? "flashlight.slash.circle.fill" : "flashlight.on.circle.fill")
                .font(.system(size: 45, weight: .bold))
                .foregroundColor((!vm.isFlashOn ? Color.black : .white).opacity(0.7))
        }

    }
    
    
}

