//
//  TodoListVIew.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import SwiftUI

struct TodoListView: View {
  @StateObject var todoListVM = TodoListVM()
  private let userId: String
  
  init(userId: String) {
    self.userId = userId
  }
  
  var body: some View {
    NavigationView {
      VStack {
        Text("List of Todos...")
      }
      .navigationTitle("Don't forget these")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button {
            print("Plus button clicked...")
            todoListVM.show()
          } label: {
            Image(systemName: "plus")
          }
        }
      }
      .sheet(isPresented: $todoListVM.showNewTaskSheet) {
        NewTodoView(showNewtaskSheetBiding: $todoListVM.showNewTaskSheet)
      }
    }
  }
}

struct TodoListVIew_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView(userId: "")
  }
}
