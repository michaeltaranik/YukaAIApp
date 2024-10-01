//
//  ScanViewModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 23.07.2024.
//

import AVKit
import Foundation
import SwiftUI
import VisionKit

enum ScanType: String {
    case barcode, text
}

enum SheetType: String {
    case profile
    case cart
    case history
    case paywall
}

enum DataScannerAccessStatusType {
    case notDetermined
    case cameraAccessNotGranted
    case cameraNotAvailable
    case scannerAvailable
    case scannerNotAvailable
}

@MainActor
final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var dataScannerAccessStatus: DataScannerAccessStatusType = .notDetermined
    @Published var recognizedItems: [RecognizedItem] = []
    @Published var scanType: ScanType = .barcode
    @Published var textContentType: DataScannerViewController.TextContentType?
    @Published var recognizesMultipleItems = false
    @Published var showBottomContainer = false
    @Published var previousCount: Int = 0
    @Published var isFlashOn: Bool = false
    @Published var recognized: Bool = false
    @Published var sheetType: SheetType?

    let recognizedDataType: DataScannerViewController.RecognizedDataType = .barcode()

      var dataScannerViewId: Int {
        var hasher = Hasher()
        hasher.combine(scanType)
        hasher.combine(false)
        if let textContentType {
            hasher.combine(textContentType)
        }
        return hasher.finalize()
    }
    
    
    func handleOnChange(_ newCount: Int) {
        guard !recognizedItems.isEmpty else { return }
        if !showBottomContainer {
            showBottomContainer.toggle()
        }
    }
    
    func toggleTorch(on: Bool) {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInTripleCamera, .builtInDualWideCamera, .builtInUltraWideCamera, .builtInWideAngleCamera, .builtInTrueDepthCamera], mediaType: AVMediaType.video, position: .back)
        
        guard
            let device = deviceDiscoverySession.devices.first,
            device.hasTorch
        else { return }

        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    }
    
    private var isScannerAvailable: Bool {
        DataScannerViewController.isAvailable && DataScannerViewController.isSupported
    }
    
    func requestDataScannerAccessStatus() async {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            dataScannerAccessStatus = .cameraNotAvailable
            return
        }
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .authorized:
            dataScannerAccessStatus = isScannerAvailable ? .scannerAvailable : .scannerNotAvailable
            
        case .restricted, .denied:
            dataScannerAccessStatus = .cameraAccessNotGranted
            
        case .notDetermined:
            let granted = await AVCaptureDevice.requestAccess(for: .video)
            if granted {
                dataScannerAccessStatus = isScannerAvailable ? .scannerAvailable : .scannerNotAvailable
            } else {
                dataScannerAccessStatus = .cameraAccessNotGranted
            }
        
        default: await requestDataScannerAccessStatus()
            
        }
    }
}

