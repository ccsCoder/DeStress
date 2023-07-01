//
//  AccountRegistrationViewModel.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import Foundation

class AccountRegistrationVM: ObservableObject {
  @Published var name: String = ""
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var confirmPassword: String = ""
  
  @Published var errorMessage = ""
  
  init () {
    
  }
  
  func register() {
    guard validate() else {
      return
    }
    // register here...
  }
  
  private func validate() -> Bool {
    errorMessage = ""
    
    guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
      errorMessage = "Please enter a name"
      return false
    }
    
    guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
      errorMessage = "Please enter your eMail."
      return false
    }
    
    // Here we have an email and a password, check for email format.
    guard email.contains("@") && email.contains(".") else {
      errorMessage = "Email is not valid."
      return false
    }
    
    guard password.trimmingCharacters(in: .whitespacesAndNewlines).count > 5 else {
      errorMessage = "Password should be at least 6 characters."
      return false
    }
    
    guard password.trimmingCharacters(in: .whitespacesAndNewlines) == confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines) else {
      errorMessage = "Both Passwords do not match"
      return false
    }
    
    return true
  }
}
