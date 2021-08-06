//
//  DataBaseConstants.swift
//  ChatAppStarter
//
//  Created by Max Polinkovsky on 20.07.21.
//

import Foundation
import Firebase

let databaseRoot = Database.database().reference()
let databaseChats = databaseRoot.child("chats")
