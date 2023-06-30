//
//  AccountRegistrationView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import SwiftUI

struct AccountRegistrationView: View {
  // UI Binding
  @State var name: String = ""
  @State var email: String = ""
  @State var password: String = ""
  @State var confirmPassword: String = ""

  var body: some View {
    VStack {
      HeaderView(title: "Register", subTitle: "Start organising chores", background: .teal, angle: 10)
      Form {
        TextField("Full name", text: $name)
        TextField("Email", text: $email)
        SecureField("Password", text: $password)
        SecureField("Re-Enter password", text: $confirmPassword)
        SolidButtonView(buttonLabel: "Create account", clickHandler: {}, buttonColor: .green)
      }
      
      Spacer()
    }
  }
}

struct AccountRegistrationView_Previews: PreviewProvider {
  static var previews: some View {
    AccountRegistrationView()
  }
}
