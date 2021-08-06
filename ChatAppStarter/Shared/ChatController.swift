//
//  ChatController.swift
//  ChatAppStarter
//
//  Created by Max Polinkovsky on 20.07.21.
//

import Combine
import SwiftUI

class ChatController: ObservableObject { //получение данных
    
    var messages = [ChatMessage]() //массив хранения сообщений
    let objectWillChange = PassthroughSubject<ChatController,Never>()
    
    func sendMessage(messageText: String) {
        let newChat = databaseChats.childByAutoId()
        let messageToSend = ["username": UserDefaults.standard.string(forKey: "username") ?? "Unknown user", "messageText": messageText]
        newChat.setValue(messageToSend)
    }
    
    func receiveMessages() {
        let query = databaseChats.queryLimited(toLast: 100)
        
        _ = query.observe(.childAdded, with: { [weak self] snapshot in
            
            if  let data = snapshot.value as? [String: String],
                let retrievedUsername = data["username"],
                let retrievedMessageText = data["messageText"],
                !retrievedMessageText.isEmpty {
                let retrievedMessage = ChatMessage(messageText: retrievedMessageText, userName: retrievedUsername)
                self?.messages.append(retrievedMessage)
                self?.objectWillChange.send(self!)
            }
        })
    }
}
