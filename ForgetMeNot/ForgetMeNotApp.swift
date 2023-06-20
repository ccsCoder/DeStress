//
//  ForgetMeNotApp.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 19/06/23.
//

import SwiftUI
import FirebaseCore

@main
struct ForgetMeNotApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
        MainView()
      }
  }
}
