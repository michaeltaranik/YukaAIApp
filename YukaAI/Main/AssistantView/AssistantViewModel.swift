//
//  AssistantViewModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 31.07.2024.
//

import Foundation
import OpenAI

class ChatController: ObservableObject {
    @Published var messages: [Message] = [
        .init(content: "Hello, I'm YukaAI. How can I help you today?", isUser: false),
        .init(content: "I'm here to assist you with any questions or concerns you may have. Feel free to ask anything, and I'll do my best to provide helpful information.", isUser: false),
        .init(content: "Hello, give the recipe for a delicious chocolate chip cookie.", isUser: true)
    ]
    
    let openAI = OpenAI(apiToken: K.apiKey)

    
    
    func sendNewMessage(content: String) {
        let userMessage = Message(content: content, isUser: true)
        self.messages.append(userMessage)
        getBotReply()
    }
    
    func getBotReply() {
        let personality = K.AIpersonality
        let query = ChatQuery(
            messages: self.messages.map({
                .init(role: .user, content: personality + $0.content)!
            }),
            model: .gpt3_5Turbo
        )
        openAI.chats(query: query) { result in
            switch result {
            case .success(let success):
                guard let choice = success.choices.first else { return }
                guard let message = choice.message.content?.string else { return }
                DispatchQueue.main.async {
                    self.messages.append(Message(content: message, isUser: false))
                }
                HapticManager.shared.notification(type: .success)
            case .failure(let failure):
                HapticManager.shared.notification(type: .error)
                print(failure)
            }
        }
    }
}




struct Message: Identifiable {
    var id: UUID = .init()
    var content: String
    var isUser: Bool
}
