//
//  Analyzer.swift
//  YukaAI
//
//  Created by Michael Taranik on 13.08.2024.
//

import UIKit


struct ImageModel: Codable {
    var imageData: Data
    var deviceID: String? = UIDevice.current.identifierForVendor?.uuidString
    
    var image: UIImage? {
        get {
            return UIImage(data: imageData)
        }
        set {
            if let newImage = newValue {
                imageData = newImage.jpegData(compressionQuality: 1.0) ?? Data()
            }
        }
    }
    
    init(image: UIImage, deviceID: String? = UIDevice.current.identifierForVendor?.uuidString) {
        self.imageData = image.jpegData(compressionQuality: 1.0) ?? Data()
        self.deviceID = deviceID
    }
}
