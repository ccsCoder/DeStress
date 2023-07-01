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
    VStack(alignment: .center, spacing: 10) {
      HeaderView(title: "Register", subTitle: "Start organising chores", background: .orange)
      
      Form {
        TextField("Full name", text: $name)
        // prevent auto capitalisatin & correction
        TextField("Email", text: $email).autocorrectionDisabled().autocapitalization(.none)
        // same for passwords or it will be really weird.
        SecureField("Password", text: $password).autocorrectionDisabled().autocapitalization(.none)
        SecureField("Re-Enter password", text: $confirmPassword).autocorrectionDisabled().autocapitalization(.none)
        SolidButtonView(buttonLabel: "Create account", clickHandler: {}, buttonColor: .green)
      }
      
      Spacer()
    }.offset(y: -50)
  }
}

struct AccountRegistrationView_Previews: PreviewProvider {
  static var previews: some View {
    AccountRegistrationView()
  }
}
