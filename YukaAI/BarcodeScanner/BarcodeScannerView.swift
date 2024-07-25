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
    
    private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = [
        ("All", .none),
        ("URL", .URL),
        ("Phone", .telephoneNumber),
        ("Email", .emailAddress),
        ("Address", .fullStreetAddress)
    ]
    
    var body: some View {
        switch vm.dataScannerAccessStatus {
        case .scannerAvailable:
            mainView
//                .onAppear(perform: {
//                    showBottomContainer.toggle()
//                })
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
            recognizedDataType: vm.recognizedDataType,
            recognizesMultipleItems: vm.recognizesMultipleItems)
        .background { Color.gray.opacity(0.3) }
//        .ignoresSafeArea()
        .id(vm.dataScannerViewId)
        .sheet(isPresented: .constant(vm.recognizedItems.count != 0)) {
            bottomContainerView
//                .background(.ultraThinMaterial)
                .background(.lightGreen)
                .presentationDetents([.medium, .fraction(0.25)])
                .presentationDragIndicator(.visible)
//                .interactiveDismissDisabled()
                .onAppear {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
                        return
                    }
                    controller.view.backgroundColor = .clear
                }
        }
        .onChange(of: vm.recognizedItems.count, { showBottomContainer = true })
        .onChange(of: vm.scanType, { vm.recognizedItems = [] })
        .onChange(of: vm.textContentType) { vm.recognizedItems = [] }
        .onChange(of: vm.recognizesMultipleItems) { vm.recognizedItems = []}
        .onChange(of: contentManager.mainTitle) { vm.recognizedItems = [] }
//        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
    }
    

    
    private var bottomContainerView: some View {
        @Binding var showBottomContainer: Bool
        
        var lastItem = vm.recognizedItems.count - 1
        var item = vm.recognizedItems[lastItem]
        
        return VStack {
//            headerView
            ScrollView {
//                LazyVStack(alignment: .leading, spacing: 16) {
//                    ForEach(vm.recognizedItems) { item in
//                        switch item {
//                        case .barcode(let barcode):
//                            Text(barcode.payloadStringValue ?? "Unknown barcode")
//                            ScanView(barcode: barcode.payloadStringValue ?? "")
//                            
//                        case .text(let text):
//                            Text(text.transcript)
//                            
//                        @unknown default:
//                            Text("Unknown")
//                        }
//                    }
//              }
                VStack {
                    switch item {
                    case .barcode(let barcode):
//                        Text(barcode.payloadStringValue ?? "Unknown barcode")
                        ScanView(barcode: barcode.payloadStringValue ?? "")
                        
                    case .text(let text):
                        Text(text.transcript)
                        
                    @unknown default:
                        Text("Unknown")
                    }
                }
//                .padding()
            }
        }
    }
    
    //    private var headerView: some View {
    //        VStack {
    //            HStack {
    //                Picker("Scan Type", selection: $vm.scanType) {
    //                    Text("Barcode").tag(ScanType.barcode)
    //                    Text("Text").tag(ScanType.text)
    //                }.pickerStyle(.segmented)
    //
    //                Toggle("Scan multiple", isOn: $vm.recognizesMultipleItems)
    //            }.padding(.top)
                
    //            if vm.scanType == .text {
    //                Picker("Text content type", selection: $vm.textContentType) {
    //                    ForEach(textContentTypes, id: \.self.textContentType) { option in
    //                        Text(option.title).tag(option.textContentType)
    //                    }
    //                }.pickerStyle(.segmented)
    //            }
    //
    //            Text(vm.headerText).padding(.top)
    //        }.padding(.horizontal)
    //    }
    
}

