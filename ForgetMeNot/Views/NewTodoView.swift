//
//  NewTodoView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import SwiftUI

struct NewTodoView: View {
  @StateObject var newTodoVM = NewTaskVM()
  
  @Binding var showNewtaskSheetBiding: Bool
  
  public func onCreate() {
    newTodoVM.save()
    showNewtaskSheetBiding = false
  }
  
  var body: some View {
    VStack(alignment: .center) {
      Spacer(minLength: 50)
      Text("New task")
        .font(.largeTitle)
      // New Task form
      Form {
        TextField("Task details", text: $newTodoVM.title)
          .textFieldStyle(DefaultTextFieldStyle())
        DatePicker("Due on", selection: $newTodoVM.dueDate)
          .datePickerStyle(.graphical)
        SolidButtonView(buttonLabel: "Create", clickHandler: self.onCreate, buttonColor: .mint, disabled: !newTodoVM.validate())
      }
    }
  }
}

struct NewTodoView_Previews: PreviewProvider {
  static var previews: some View {
    NewTodoView(showNewtaskSheetBiding: Binding(get: {
      return true
    }, set: { _ in }))
  }
}
