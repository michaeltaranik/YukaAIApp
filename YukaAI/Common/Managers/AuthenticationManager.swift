//
//  AuthenticationManager.swift
//  YukaAI
//
//  Created by Michael Taranik on 14.08.2024.
//

//import Foundation
//import FirebaseAuth
//import FirebaseAnalytics
//
//@MainActor
//final class AuthenticationManager {
//    
//    static let shared = AuthenticationManager(); private init() {}
//    
//    func signIn() async throws {
//        Auth.auth().signInAnonymously { authResult, error in
//            guard let user = authResult?.user else {
//                HapticManager.shared.notification(type: .error)
//                print(error ?? "error")
//                return
//            }
//            let isAnonymous = user.isAnonymous  // true
//            let uid = user.uid
//            print("USER: ")
//            print(isAnonymous)
//            print(uid)
//            print(user.metadata)
//            HapticManager.shared.notification(type: .success)
//        }
//    }
//    
//}





