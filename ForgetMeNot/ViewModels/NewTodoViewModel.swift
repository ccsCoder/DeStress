//
//  NewTodoViewModel.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import Foundation

class NewTodoVM: ObservableObject {
  @Published var title:String = ""
  @Published var dueDate: Date = Date()
  
  init() {}
  
  public func validate() -> Bool {
    guard !title.trimmingCharacters(in: .whitespaces).isEmpty && dueDate >= Date() else {
      return false
    }
    return true
  }
  
  public func save() {
    print("Save called...")
  }
}
