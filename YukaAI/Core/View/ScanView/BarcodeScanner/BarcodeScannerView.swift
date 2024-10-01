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
            frame.ignoresSafeArea(.all)
            upperFrame
            lowerFrame
            barcodeZoneFrame
        }
        .fullScreenCover(isPresented: .init(value: $vm.sheetType)) {
            switch vm.sheetType {
            case .profile:
                AccountView()
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
    
    @ViewBuilder
    var frame: some View {
        let gradientBlackColors = [
            .black.opacity(0.78),
            .black.opacity(0.62),
            .black.opacity(0.4),
            .black.opacity(0.22),
            .black.opacity(0.08),
            Color.clear
        ]
        
        let upperGradient = LinearGradient(
            colors: gradientBlackColors,
            startPoint: .top, endPoint: .bottom)
        let lowerGradient = LinearGradient(
            colors: gradientBlackColors,
            startPoint: .bottom, endPoint: .top)
        
        VStack {
            Rectangle()
                .fill(upperGradient)
                .frame(height: 300)
            Spacer()
            Rectangle()
                .fill(lowerGradient.opacity(0.9))
                .frame(height: 200)
        }
    }
    
    var upperFrame: some View {
        VStack {
            HStack {
                Button {
                    HapticManager.shared.impact(style: .medium)
                    vm.sheetType = .paywall
                } label: {
                    //                        PremiumIconView()
                    PremiumOldIconView()
                    
                }
                
                Spacer()
                Text("Scan")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                Spacer()
                CornerIconView(
                    imageName: "list.bullet.clipboard",
                    onTap: { vm.sheetType = .history })
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    var lowerFrame: some View {
        VStack {
            Spacer()
            VStack {
                TempHintView()
                HStack {
                    CornerIconWInfoView(
                        imageName: "cart",
                        info: String(cartVM.products.count),
                        onTap: {
                            vm.sheetType = .cart
                        }
                    )
                    
                    Spacer()
                    
                    takePhotoButton
                    
                    Spacer()
                    
                    CornerIconView(
                        imageName: "person.fill",
                        onTap: { vm.sheetType = .profile }
                    )
                }
            }
        }
    }
    
    var takePhotoButton: some View {
        Circle()
            .stroke(lineWidth: 4)
            .fill(.white)
            .frame(width: 72, height: 72)
            .overlay {
                Circle()
                    .frame(width: 61, height: 61)
                    .foregroundColor(.white)
            }
            .onTapGesture {
                HapticManager.shared.impact(style: .medium)
                vm.sheetType = .paywall
            }
    }
    
    var barcodeZoneFrame: some View {
        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .stroke(vm.recognized ? .greenish : .white,
                    lineWidth: vm.recognized ? 10 : 2)
            .frame(width: 300, height: 300)
    }
}

