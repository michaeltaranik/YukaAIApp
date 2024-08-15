//
//  HealthManager.swift
//  YukaAI
//
//  Created by Michael Taranik on 22.07.2024.
//

import Foundation
import HealthKit


enum HealthError: Error {
    case HealthDataNotAvailable
}


class HealthManager: ObservableObject {
    
//    static let shared = HealthManager()
    
    
    var healthStore: HKHealthStore?
    var lastError: Error?
    
    
    var stepCountToday: Int = 0
    var thisWeekSteps: [Int: Int] = [1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0]
    
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        } else {
            lastError = HealthError.HealthDataNotAvailable
        }
    }
    
    
    func requestAuthorization() async {
        guard let stepType =  HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        guard let healthStore = self.healthStore else { return }
        
        do {
            try await healthStore.requestAuthorization(toShare: [], read: [stepType])
        } catch {
            lastError = error
        }
    }
    
    
}
