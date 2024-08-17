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
    private let gradientBlackColors = [
        Color.black,
        .black.opacity(0.92),
        .black.opacity(0.78),
        .black.opacity(0.54),
        .black.opacity(0.32),
        .black.opacity(0.22),
        Color.clear
    ]
    
    let newItems = 3
    
    
    var body: some View {
        ZStack {
            scanner
            frame.ignoresSafeArea(.all)
            upperFrame
            lowerFrame
            barcodeFrame
        }
        .sheet(isPresented: $vm.shouldShowSheet) {
            switch vm.sheetType {
            case .profile:
                AccountView()
            case .cart:
                CartView()
            case .history:
                CartView()
            case .paywall:
                ProfileView()
            case .main:
                BarcodeScannerView()
            }
        }
    }
    
    
    @ViewBuilder
    var frame: some View {
        
        let upperGradient = LinearGradient(
            colors: gradientBlackColors,
            startPoint: .top, endPoint: .bottom)
        
        VStack {
            Rectangle()
                .fill(upperGradient)
                .frame(height: 250)
            Spacer()

        }
    }
    
    
    
    
    var upperFrame: some View {
        VStack {
            ZStack {
                HStack {
                    proIcon
                        .padding(.leading, 20)
                        .padding(.top, 20)
                    Spacer()
                    Button {
                        vm.sheetType = .history
                        vm.shouldShowSheet.toggle()
                        HapticManager.shared.impact(style: .medium)
                    } label: {
                        cornerIcon(imageName: "list.bullet.clipboard")
                    }
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black.opacity(0.5))
                    .padding(.top, 20)
                    .padding(.trailing, 20)

                }
                Text("Scan")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .padding(.bottom, 35)
                    .offset(x: 0, y: -10)
            }
            Spacer()
        }
        
        
    }
    
    
    @ViewBuilder
    var lowerFrame: some View {
        VStack {
            Spacer()
            VStack {
                captureIcon
                HStack {
                    Button {
                        vm.sheetType = .cart
                        vm.shouldShowSheet.toggle()
                        HapticManager.shared.impact(style: .medium)
                    } label: {
                        cartIcon
                    }
                    Spacer()
                    cameraIcon
                    Spacer()
                    Button {
                        vm.sheetType = .profile
                        vm.shouldShowSheet.toggle()
                        HapticManager.shared.impact(style: .medium)
                    } label: {
                        profileIcon
                    }
                }
            }
        }
    }
    
    
    
    var cartIcon: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                Image(systemName: "cart")
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                    .offset(x: -2, y: 2)
            }
                
            ZStack {
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.greenGradient2)
                    
                Text("\(newItems)")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
            }
            .offset(x: 22, y: -23)
        }
        .bold()
        .frame(width: 50, height: 50)
        .foregroundColor(.black.opacity(0.5))
        .padding(.leading, 20)
    }
    
    
    var profileIcon: some View {
        cornerIcon(imageName: "person")
            .bold()
            .frame(width: 50, height: 50)
            .foregroundColor(.black.opacity(0.5))
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



extension BarcodeScannerView {
    
    
    
    @ViewBuilder
    var cameraIcon: some View {
        
        let color = LinearGradient(
            colors: [.greenGradient1, .greenGradient2],
            startPoint: .leading, endPoint: .trailing)
        
        HStack {
            Circle()
                .stroke(lineWidth: 8)
                .fill(color)
                .frame(width: 80, height: 80)
        }
    }
    
    @ViewBuilder
    var captureIcon: some View {
        
        let color = LinearGradient(
            colors: [.greenGradient1, .greenGradient2],
            startPoint: .leading, endPoint: .trailing)
        
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .fill(color.opacity(0.8))
                .frame(width: 200, height: 40)
                .overlay {
                    HStack {
                        Image(systemName: "wand.and.stars.inverse")
                        Text("Capture everything!")
                    }
                    .foregroundColor(.white)
                    .bold()
                }
        }
    }
    
    
    @ViewBuilder
    var proIcon: some View {
        
        let color = LinearGradient(
            colors: [.greenGradient1, .greenGradient2],
            startPoint: .leading, endPoint: .trailing)
        
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .fill(color.opacity(0.8))
                .frame(width: 100, height: 40)
            HStack {
                Image(systemName: "crown")
                Text("PRO")
            }
            .font(.system(size: 18, weight: .bold, design: .serif))
            .foregroundColor(.white)
            .bold()
        }
    }
    
    
    @ViewBuilder
    fileprivate func cornerIcon(imageName: String) -> ZStack<TupleView<(RoundedRectangle, some View)>> {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            Image(systemName: imageName)
                .font(.system(size: 25, weight: .regular, design: .rounded))
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



#Preview {
    BarcodeScannerView()
}
