//
//  FileManagerExt.swift
//  YukaAI
//
//  Created by Michael Taranik on 07.08.2024.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
