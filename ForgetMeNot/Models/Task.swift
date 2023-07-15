//
//  TodoItem.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import Foundation

/// Identifiaable

struct Task: Codable, Identifiable {
  let id: String
  let title: String
  let dueDate: TimeInterval
  let createdOn: TimeInterval
  var isComplete: Bool
  
  mutating func toggleComplete(flag: Bool) {
    isComplete = flag
  }
  
}

