//
//  ToDoItemView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import SwiftUI

struct TaskView: View {
  @StateObject var taskItemVM = TaskItemVM()
  // pass in a reference to a Task
  let task: Task
  var formattedDate: String {
    return Date(timeIntervalSince1970: task.dueDate).formatted(
      date: .abbreviated,
      time: .shortened)
  }
  
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 5) {
        Text(task.title)
          .font(.title2)
          .strikethrough(task.isComplete)
        Text("\(formattedDate)")
          .strikethrough(task.isComplete)
      }
      // to fill up the space on the right.
      Spacer()
      // Complete / not-complete button
      Button {
        taskItemVM.toggleIsDone(task: task)
      } label: {
        Image(systemName: task.isComplete ? "square.fill" : "square")
      }
    }
  }
}

struct ToDoItemView_Previews: PreviewProvider {
  static var previews: some View {
    TaskView(task: Task(id: UUID().uuidString, title: "Remember the milk", dueDate: Date().timeIntervalSince1970, createdOn: Date().timeIntervalSince1970, isComplete: true))
  }
}
