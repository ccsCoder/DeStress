//
//  TodoListViewModel.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import FirebaseFirestore
import Foundation

class TaskListVM: ObservableObject {
  private let userId: String
  @Published var showNewTaskSheet = false
  
  init(userId: String) {
    self.userId = userId
  }

  public func show() {
    showNewTaskSheet = true
  }

  public func hide() {
    showNewTaskSheet = false
  }

  public func deleteTask(taskId: String) {
    print("Delete called with userId = \(userId), \(taskId)")
    let db = Firestore.firestore()
    
    db.collection(Constants.DataBaseKeys.UserCollection)
    .document(userId)
    .collection(Constants.DataBaseKeys.TasksCollection)
    .document(taskId)
    .delete() { err in
      if let err = err {
        print("Error while removing document: \(err) ")
      } else {
        print("Document removed successfully !")
      }
    }
  }
}
