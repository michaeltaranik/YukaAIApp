//
//  AssistantFileManager.swift
//  YukaAI
//
//  Created by Michael Taranik on 09.08.2024.
//

import Foundation

class AssistantMessageFileManager {
    func saveMessages(_ messages: [Message]) {
        do {
            let url = try getDocumentsDirectory().appendingPathComponent(".json")
            let data = try JSONEncoder().encode(messages)
            try data.write(to: url, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Error saving messages: \(error.localizedDescription)")
        }
    }
    
//    func deleteMessages(withDate datetime: String, forRoom roomID: String) {
//        var conversationMessages = loadMessages(forRoom: roomID)
//        conversationMessages.removeAll { $0.datetime == datetime }
//        saveMessages(conversationMessages, forRoom: roomID)
//    }
    
    func loadMessages() -> [Message] {
        do {
            let url = try getDocumentsDirectory().appendingPathComponent(".json")
            let data = try Data(contentsOf: url)
            let messages = try JSONDecoder().decode([Message].self, from: data)
            return messages
        } catch {
            print("Error loading messages: \(error.localizedDescription)")
            return [Message(content: K.ai.introductionMessage, isUser: false)]
        }
    }
    
    private func getDocumentsDirectory() throws -> URL {
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
}
