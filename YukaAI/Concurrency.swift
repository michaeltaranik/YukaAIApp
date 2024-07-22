//
//  Concurrency.swift
//  YukaAI
//
//  Created by Michael Taranik on 17.07.2024.
//

import SwiftUI

/*
 do-catch
 try
 throws
 */

class ConcurrencyDataManager {
    
    var isActive = true
    
    func getTitle() throws -> String {
        if isActive {
            return "Approved"
        } else {
            throw URLError(.badURL)
        }
    }
    
    func getTitleThrow() throws -> String {
        throw URLError(.badURL)
    }
    
}


class ConcurrencyViewModel: ObservableObject {
    
    @Published var text: String = "starting text"
    let manager = ConcurrencyDataManager()
    
    /*
    func fetchTitle() -> String {
        return text == "idi nahui, zaebal" ? "blyat" : "idi nahui, zaebal"
    }
    func changeTitle() {
       text = text == "idi nahui, zaebal" ? "blyat" : "idi nahui, zaebal"
    }
     */
    
    func fetchTitle() {
        do {
            let newTitle = try? manager.getTitleThrow()
            if let safeTitle = newTitle {
                self.text = safeTitle
            }
            
            let final = try manager.getTitle()
            self.text = final
        } catch let error {
            self.text = error.localizedDescription
        }
    }
    
    
}


struct Concurrency: View {
    
    @StateObject private var viewModel = ConcurrencyViewModel()
    
    var body: some View {
        
//        ZStack {
//            Color(.lightGreen)
//                .ignoresSafeArea()
//            HStack {
//                Image(systemName: "checkmark.circle.fill")
//                Text(viewModel.text)
//                    .padding(-5)
//                    .font(.system(size: 24))
//            }
//                    .frame(width: 200, height: 100)
//                    .background(.lightGreen)
//                    .foregroundColor(.darkGreen)
//                    .onTapGesture {
//                        viewModel.fetchTitle()
//                    }
//                    .cornerRadius(20)
//                    .shadow(radius: 20)
//        }
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .frame(width: 200, height: 200)
                        .background(.red)
                }
            }
        }
//        .frame(height: 350)
    }
}

#Preview {
    Concurrency()
}
