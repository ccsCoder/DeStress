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
  
  private func requestNotificationPermission(task: Task) {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { [self] granted, err in
      
      if (err != nil) {
        error = "An error occurred while requesting permission for notifications !"
        return
      }
      print("***FGM permission granted = \(granted)")
      // Enable or disable features based on the authorization.
      if (granted) {
        scheduleNotification(task: task)
      }
    }
  }
  
  // This is the method that schedules notifications...
  private func scheduleNotification(task: Task) {
    print("***FGM scheduleNotificationCalled...")
    let content = UNMutableNotificationContent()
    content.title = "Forget me not !"
    content.body = task.title
    content.sound = UNNotificationSound.default

    
    // Configure the recurring date.
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    
    let dueDate = Date(timeIntervalSince1970: task.dueDate)
    
    print("***FGM Task dueDate = \(dueDate)")
    
    // set components
    dateComponents.day = Calendar.current.component(.day, from: dueDate)
    dateComponents.hour = Calendar.current.component(.hour, from: dueDate)
    dateComponents.minute = Calendar.current.component(.minute, from: dueDate)
    dateComponents.month = Calendar.current.component(.month, from: dueDate)
    dateComponents.year = Calendar.current.component(.year, from: dueDate)
    
    print("***FGM \(dateComponents)")

    
    // Create the trigger as a repeating event.
    let trigger = UNCalendarNotificationTrigger(
      dateMatching: dateComponents, repeats: false)
    
    // create the notification request.
    let notificationRequest = UNNotificationRequest(
      identifier: task.id, content: content, trigger: trigger
    )
    
    // schedule
    UNUserNotificationCenter.current().add(notificationRequest) { [self] err in
      if err != nil {
        error = "Something went wrong while scheduling notifications"
      }
    }
  }
  
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
    
    // Ask for notifications permission
    requestNotificationPermission(task: newTask)
  }
}
