//
//  BindingExt.swift
//  YukaAI
//
//  Created by Michael Taranik on 07.08.2024.
//

import Foundation
import SwiftUICore

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
