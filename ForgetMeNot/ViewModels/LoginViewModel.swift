//
//  LoginViewModel.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import Foundation
import FirebaseAuth

// ViewModels are used to encapsulate View Related data & business logic.
class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  
  @Published var errorMessage = "" // to hold error messages
  
  init() {
    
  }
  
  func login() {
    guard validate() else {
      return
    }
    //We can try login here.
    Auth.auth().signIn(withEmail: email, password: password)
  }
  
  private func validate() -> Bool {
    errorMessage = ""
    
    guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
      errorMessage = "Please enter your E-Mail."
      return false
    }
    
    guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
      errorMessage = "Please enter the password."
      return false
    }
    
    // Here we have an email and a password, check for email format.
    guard email.contains("@") && email.contains(".") else {
      errorMessage = "Email is not valid."
      return false
    }
    
    // Now we can login
    print("Go ahead with the login.")
    return true
  }
}
