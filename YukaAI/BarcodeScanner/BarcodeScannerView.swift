//
//  BarcodeScannerView.swift
//  YukaAI
//
//  Created by Michael Taranik on 23.07.2024.
//

import SwiftUI
import VisionKit

struct BarcodeScannerView: View {
    
    @EnvironmentObject var vm: ScanViewModel
    @EnvironmentObject var contentManager: ContentViewManager
    
    @State var showBottomContainer = false
    
    
    var body: some View {
        switch vm.dataScannerAccessStatus {
        case .scannerAvailable:
            mainView
        case .cameraNotAvailable:
            Text("Your device doesn't have a camera")
        case .scannerNotAvailable:
            Text("Your device doesn't have support for scanning barcode with this app")
        case .cameraAccessNotGranted:
            Text("Please provide access to the camera in settings")
        case .notDetermined:
            Text("Requesting camera access")
        }
    }
    
    private var mainView: some View {
        DataScannerView(
            recognizedItems: $vm.recognizedItems,
            recognizedDataType: vm.recognizedDataType)
        .background { Color.gray.opacity(0.3) }
//        .id(vm.dataScannerViewId)
        .sheet(isPresented: .constant(vm.recognizedItems.count != 0)) {
            bottomContainerView
                .background(.lightGreen)
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
        .onChange(of: vm.recognizedItems.count, { showBottomContainer = true })
        .onChange(of: contentManager.mainTitle) { vm.recognizedItems = [] }
    }
    

    
    private var bottomContainerView: some View {
        @Binding var showBottomContainer: Bool
        
        var lastItem = vm.recognizedItems.count - 1
        var item = vm.recognizedItems[lastItem]
        
        return VStack {
            ScrollView {
                VStack {
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
    }
}

