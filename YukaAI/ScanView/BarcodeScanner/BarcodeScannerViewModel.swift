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
    
    
//    func showNewProduct() -> Bool {
//        let lastItem = recognizedItems.count - 1
//        let last = recognizedItems[lastItem]
//        let lastlast = recognizedItems[lastItem - 1]
//        switch last {
//        case .text(_):
//            return false
//        case .barcode(let barcode):
//            switch lastlast {
//            case .text(_):
//                return false
//            case .barcode(let otherBarcode):
//                return barcode.payloadStringValue != otherBarcode.payloadStringValue
//            @unknown default:
//                return false
//            }
//        @unknown default:
//            return false
//        }
//        
//        
//    }
    
    
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
