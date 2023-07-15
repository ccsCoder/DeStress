//
//  TaskListView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TaskListView: View {
  @StateObject var taskListVM: TaskListVM
  
  // Firebase will query it.
  @FirestoreQuery var tasks: [Task]
  
  init(userId: String) {
    // initialise tasks, the _ is a convention while accessing property wrappers.
    self._tasks = FirestoreQuery(collectionPath: "\(Constants.DataBaseKeys.UserCollection)/\(userId)/\(Constants.DataBaseKeys.TasksCollection)")
    self._taskListVM = StateObject(wrappedValue: TaskListVM(userId: userId))
  }
  
  var body: some View {
    NavigationView {
      VStack {
        List(tasks) { task in
          TaskView(task: task)
            .swipeActions {
              Button {
                taskListVM.deleteTask(taskId: task.id)
              } label: {
                Image(systemName: "trash.fill")
              }
              .tint(.red)
            }
        }.listStyle(PlainListStyle())
      }.padding(.top, 20)
      .navigationTitle("Don't forget these")
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button {
            taskListVM.show()
          } label: {
            Image(systemName: "plus")
          }
        }
      }
      .sheet(isPresented: $taskListVM.showNewTaskSheet) {
        NewTodoView(showNewtaskSheetBiding: $taskListVM.showNewTaskSheet)
      }
    }
  }
}

struct TodoListVIew_Previews: PreviewProvider {
  static var previews: some View {
    TaskListView(userId: "ThvcudIuItfNAXlj04BvCTxp2iN2")
  }
}
