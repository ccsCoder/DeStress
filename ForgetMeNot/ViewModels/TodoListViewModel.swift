//
//  TodoListViewModel.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import Foundation

class TodoListVM: ObservableObject {
  @Published var showNewTaskSheet = false
  
  public func show() {
    showNewTaskSheet = true
    print("Shown = ", showNewTaskSheet)
  }
  
  public func hide() {
    showNewTaskSheet = false
  }
  
  init() {}
}
