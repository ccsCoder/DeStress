//
//  AccountRegistrationViewModel.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

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
    Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
      guard let userId = result?.user.uid else {
        self?.errorMessage = "Error: \(String(describing: error?.localizedDescription))"
        return
      }
      // Insert a user record in Firebase
      self?.insertUserRecord(id: userId)
    }
  }
  
  private func insertUserRecord(id: String) {
    let newUser = User(id: id, name: name, email: email, joiningDate: Date().timeIntervalSince1970)
    
    // Firebase specific thingy
    let db = Firestore.firestore()
    db.collection("users").document(id).setData(newUser.asDictionary())
    
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
