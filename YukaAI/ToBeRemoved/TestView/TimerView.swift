//
//  Timer.swift
//  YukaAI
//
//  Created by Michael Taranik on 07.08.2024.
//

import SwiftUI
//import Combine

struct TimerView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    
    
    
    var body: some View {
        
        let time = currentDate.description.components(separatedBy: " ")
        
        VStack {
            Text(time[1])
                .font(.system(size: 60, weight: .bold, design: .default))
                .task {
                    print(currentDate)
                    print(timer)
                }
                .onReceive(timer) { second in
                    currentDate = second
                }
        }
        
    }
}

#Preview {
    TimerView()
}
