//
//  ContentView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 19/06/23.
//

import SwiftUI
//import LoginView

struct MainView: View {
  var body: some View {
      VStack {
        NavigationView {
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
