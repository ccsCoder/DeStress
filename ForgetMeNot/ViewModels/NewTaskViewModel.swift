//
//  NewTodoViewModel.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewTaskVM: ObservableObject {
  @Published var title:String = ""
  @Published var dueDate: Date = Date()
  var error:String = ""
  
  init() {}
  
  public func validate() -> Bool {
    guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
      error = "Please enter task name/title"
      return false
    }
    
    guard  dueDate >= Date() else {
      error = "Due date cannot be in the past, unless you know how to Time Travel"
      return false
    }
    return true
  }
  
  public func save() {
    // get the current user id.
    guard let userId = Auth.auth().currentUser?.uid else {
      error = "There was a problem getting current user details"
      return
    }
    
    // instantiate the Task Model
    let newTask = Task(
      id: UUID().uuidString,
      title: title,
      dueDate: dueDate.timeIntervalSince1970,
      createdOn: Date().timeIntervalSince1970,
      isComplete: false
    )
    
    // save.
    Firestore.firestore().collection(Constants.DataBaseKeys.UserCollection)
      .document(userId)
      .collection(Constants.DataBaseKeys.TasksCollection)
      .document(newTask.id)
      .setData(newTask.asDictionary())
    
  }
}
