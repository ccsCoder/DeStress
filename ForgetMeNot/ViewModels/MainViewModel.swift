//
//  MainViewModel.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
  @Published var currUserId: String = ""
  
  // to avoid the whole recreating the closure every time thingy.
  private var onLoginStateChanged: AuthStateDidChangeListenerHandle?
  
  init() {
    self.onLoginStateChanged = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
      self?.currUserId = user?.uid ?? ""
    })
  }
}
