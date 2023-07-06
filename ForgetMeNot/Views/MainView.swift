//
//  ContentView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 19/06/23.
//

import SwiftUI
//import LoginView

struct MainView: View {
  @StateObject var mainVM = MainViewModel()
  
  var body: some View {
      VStack {
        // If user is already logged in, do not show main view, instead, show the TODOs view.
        if !mainVM.currUserId.isEmpty {
          TodoListView()
        } else {
          LoginView()
        }
        
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
