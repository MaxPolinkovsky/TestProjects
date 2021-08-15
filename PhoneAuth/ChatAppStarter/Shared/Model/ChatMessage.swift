//
//  ChatMessage.swift
//  ChatAppStarter
//
//  Created by Max Polinkovsky on 20.07.21.
//

import Foundation

struct ChatMessage: Hashable {
    let messageText: String
    let userName: String
    let isMe: Bool
    let messageID = UUID()
    
    init(messageText: String, userName: String) {
            self.messageText = messageText
            self.userName = userName
            if UserDefaults.standard.string(forKey: "username") == userName {
                self.isMe = true
            } else {
                self.isMe = false
            }
        }
}
