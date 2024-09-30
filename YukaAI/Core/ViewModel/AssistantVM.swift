//
//  AssistantViewModel.swift
//  YukaAI
//
//  Created by Michael Taranik on 31.07.2024.
//

import Foundation
import OpenAI

struct Message: Identifiable, Codable {
    var id: UUID = .init()
    var content: String
    var isUser: Bool
}

class AssistantVM: ObservableObject {
    
    @Published var messages: [Message] = [Message(content: K.ai.introductionMessage, isUser: false)]
    @Published var showKeyboard: Bool = false
    @Published var shouldShowRecs: Bool = false
    @Published var shouldShowProfile: Bool = false
    
    private let openAI = OpenAI(apiToken: K.api.aiAPIKey)
    private let fileManager = AssistantMessageFileManager()
    
    init() {
        self.messages = fileManager.loadMessages()
    }
    
    func sendNewMessage(content: String) {
        let userMessage = Message(content: content, isUser: true)
        self.messages.append(userMessage)
        getBotReply()
    }
    
    private func getBotReply() {
        let personality = K.ai.AIpersonality
        let query = ChatQuery(
            messages: self.messages.map({
                .init(role: .user, content: personality + $0.content)!
            }),
            model: .gpt4_o_mini
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
                self.fileManager.saveMessages(self.messages)
            case .failure(let failure):
                HapticManager.shared.notification(type: .error)
                print(failure)
            }
        }
    }
}
