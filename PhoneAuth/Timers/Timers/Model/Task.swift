//
//  Task.swift
//  Timers
//
//  Created by Max Polinkovsky on 06.07.21.
//

import Foundation

class Task {
  let name: String
  let creationDate = Date()
  var completed = false
    
    init(name: String) {
    self.name = name
  }
}
