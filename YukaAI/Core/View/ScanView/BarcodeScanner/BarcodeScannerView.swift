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
    
    @EnvironmentObject private var cartVM: CartViewModel
    @StateObject var vm = BarcodeScannerViewModel()
    
    var body: some View {
        ZStack {
            scanner
            BarcodeFrameView(
                upperFrameContent: upperFrame,
                lowerFrameContent: lowerFrame,
                paddingTop: 50)
            CameraZoneFrameView(recognized: $vm.recognized)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: .init(value: $vm.sheetType)) {
            switch vm.sheetType {
            case .profile:
                ProfileView()
            case .cart:
                HistoryView()
            case .history:
                HistoryView()
            case .paywall:
                PaywallView()
            default:
                PaywallView()
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
        .environmentObject(CartViewModel())
}

extension BarcodeScannerView {
    
    var upperFrame: some View {
        HStack {
            PremiumButtonView(onTap: { vm.sheetType = .paywall }, isOldIcon: false)
            
            Spacer()
            
            toggleTorchButton
            CornerIconView(
                imageName: "list.bullet.clipboard",
                onTap: { vm.sheetType = .history })
        }
        
    }
    
    var lowerFrame: some View {
        VStack {
            TempHintView()
            
            HStack {
                CornerIconWInfoView(
                    imageName: "cart",
                    info: String(cartVM.products.count),
                    onTap: { vm.sheetType = .cart })
                
                Spacer()
                
                TakePhotoButtonView(onTap: { vm.sheetType = .paywall })

                Spacer()
                
                CornerIconView(
                    imageName: "chart.bar.xaxis.ascending.badge.clock.rtl",
                    onTap: { vm.sheetType = .charts })
            }
        }
    }
    
    var toggleTorchButton: some View {
        CornerIconView(
            imageName: vm.isTorchOn ? "flashlight.on.fill" : "flashlight.off.fill") {
                vm.toggleTorch()
            }
    }
}
