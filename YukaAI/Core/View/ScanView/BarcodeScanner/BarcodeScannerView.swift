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
    
    private let gradientBlackColors = [
        .black.opacity(0.78),
        .black.opacity(0.62),
        .black.opacity(0.4),
        .black.opacity(0.22),
        .black.opacity(0.08),
        Color.clear
    ]
    
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
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                withAnimation{
                    self.vm.shouldShowHint.toggle()
                }
            })
        }
    }
}

#Preview {
    BarcodeScannerView()
        .environmentObject(CartViewModel())
}

extension BarcodeScannerView {
    
    @ViewBuilder
    var temporaryHint: some View {
        VStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .fill(Color.theme.iconBackColor)
                .frame(width: 160, height: 35)
            Rectangle()
                .trim(from: 0.5, to: 1)
                .fill(Color.theme.iconBackColor)
                .rotationEffect(.degrees(-45))
                .frame(width: 12, height: 12)
                .scaleEffect(x: 2, y: 1, anchor: .center)
                .offset(x: 0, y: -14)
        }
        .overlay {
            HStack {
                Image(systemName: "camera.shutter.button")
                    .offset(x: 3, y: -2)
                    .font(.system(size: 15, weight: .regular, design: .default))
                Text("Take photo of a cart")
                    .font(.system(size: 12, weight: .regular, design: .default))
            }
            .foregroundColor(.white)
            .bold()
            .offset(x: 0, y: -14)
        }
    }
    
    @ViewBuilder
    var proIcon: some View {
        
        let color = LinearGradient(
            colors: [.greenGradient1, .greenGradient2],
            startPoint: .leading, endPoint: .trailing)
        
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 11, height: 11))
                .fill(color.opacity(0.8))
                .frame(width: 95, height: 35)
            HStack {
                Image(systemName: "crown")
                    .shadow(color: .black.opacity(0.3), radius: 4)
                    .offset(x: 0, y: -2)
                Text("PRO")
                    .shadow(color: .black.opacity(0.3), radius: 4)
            }
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(.white)
            .bold()
            .offset(x: -2, y: 1)
        }
    }
    
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
                    proIcon
                        .padding(.leading, 20)
                        .padding(.top, 10)
                        .offset(x: -5, y: 0)
                }
                
                Spacer()
                Text("Scan")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .offset(x: -18, y: 5)
                Spacer()
                CornerIconView(
                    imageName: "list.bullet.clipboard",
                    onTap: { vm.sheetType = .history })
                .padding(.top, 10)
                .padding(.trailing, 20)
                
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    var lowerFrame: some View {
        VStack {
            Spacer()
            VStack {
                if vm.shouldShowHint {
                    temporaryHint
                        .offset(x: 0, y: 7)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                                withAnimation{
                                    self.vm.shouldShowHint.toggle()
                                }
                            })
                        }
                }
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

