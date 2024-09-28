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
    @StateObject private var cartVM = CartViewModel()
    
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
            barcodeFrame
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
                    Button {
                        HapticManager.shared.impact(style: .medium)
                        vm.sheetType = .history
                    } label: {
                        cornerIcon(imageName: "list.bullet.clipboard")
                    }
                    .frame(width: 50, height: 50)
                    .foregroundStyle(Color.theme.iconBackColor)
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
                    captureIcon
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
                    Button {
                        HapticManager.shared.impact(style: .medium)
                        vm.sheetType = .cart
                    } label: {
                        cartIcon
                    }
                    Spacer()
                    Button {
                        vm.sheetType = .paywall
                        HapticManager.shared.impact(style: .medium)
                    } label: {
                        cameraIcon
                    }

                    
                    Spacer()
                    Button {
                        HapticManager.shared.impact(style: .medium)
                        vm.sheetType = .profile
                    } label: {
                        profileIcon
                    }
                    .padding(.top, 10)
                }
            }
        }
    }
    
    var cartIcon: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 13, height: 13))
                    .frame(width: 45, height: 45)
                Image(systemName: "cart")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                    .offset(x: -1, y: 2)
            }
                
            ZStack {
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.greenGradient2)
                    
                Text("\(cartVM.products.count)")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .heavy, design: .rounded))
            }
            .offset(x: 22, y: -23)
        }
        .bold()
        .frame(width: 50, height: 50)
        .foregroundStyle(Color.theme.iconBackColor)
        .padding(.leading, 20)
    }
    
    var profileIcon: some View {
        cornerIcon(imageName: "person.fill")
            .frame(width: 50, height: 50)
            .foregroundStyle(Color.theme.iconBackColor)
            .padding(.trailing, 20)
    }
    
    var barcodeFrame: some View {
        ZStack {
//            Color.black.opacity(0.55)
//                .mask {
//                    Rectangle()
//                        .cornerRadius(20)
//                        .overlay(
//                            Rectangle()
//                                .frame(width: 300, height: 300)
//                                .cornerRadius(20)
//                                .blendMode(.destinationOut)
//                        )
//                }
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

#Preview {
    BarcodeScannerView()
}

extension BarcodeScannerView {
    @ViewBuilder
    var cameraIcon: some View {
        //        let color = LinearGradient(
        //            colors: [.greenGradient1, .greenGradient2],
        //            startPoint: .leading, endPoint: .trailing)
        HStack {
            Circle()
                .stroke(lineWidth: 4)
                .fill(.white)
                .frame(width: 72, height: 72)
                .overlay {
                    Circle()
                        .frame(width: 61, height: 61)
                        .foregroundColor(.white)
                }
        }
    }
    
    @ViewBuilder
    var captureIcon: some View {
        //        let color = LinearGradient(
        //            colors: [.greenGradient1, .greenGradient2],
        //            startPoint: .leading, endPoint: .trailing)
        ZStack {
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
                .offset(x: 0, y: -13)
            }
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
    
    @ViewBuilder
    fileprivate func cornerIcon(imageName: String) -> some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 13, height: 13))
                .frame(width: 45, height: 45)
            
            Image(systemName: imageName)
                .font(.system(size: 20, weight: .regular, design: .rounded))
                .foregroundColor(.white)
                .padding(.bottom, 5)
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
}
