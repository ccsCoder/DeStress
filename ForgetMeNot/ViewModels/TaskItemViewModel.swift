//
//  ToDoItemViewModel.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TaskItemVM: ObservableObject {
  
  func toggleIsDone(task: Task) {
    // check for logged in user
    guard let userId = Auth.auth().currentUser?.uid else {
      print("Error while getting logged in users' details...")
      return
    }
    
    Firestore.firestore()
      .collection(Constants.DataBaseKeys.UserCollection)
      .document(userId)
      .collection(Constants.DataBaseKeys.TasksCollection)
      .document(task.id)
      .setData([
        "isComplete": !task.isComplete
      ], merge: true)
  }
}
