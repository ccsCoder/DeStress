//
//  ContentView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 19/06/23.
//

import SwiftUI

struct MainView: View {
  @StateObject var mainVM = MainViewModel()

  var body: some View {
    VStack {
      // If user is already logged in, do not show main view, instead, show the TODOs view.
      if !mainVM.currUserId.isEmpty {
        accountView
      } else {
        LoginView()
      }
    }
  }
  
  // we can abstract some stuff in computed properties/ functions.
  @ViewBuilder
  var accountView: some View {
    TabView {
      TodoListView(userId: mainVM.currUserId)
        .tabItem {
          Label("Home", systemImage: "house")
        }
      ProfileView()
        .tabItem {
          Label("Profile", systemImage: "person.circle")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
