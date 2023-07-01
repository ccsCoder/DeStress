//
//  AccountRegistrationView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import SwiftUI

struct AccountRegistrationView: View {
  // UI Binding
  @StateObject var registerVM = AccountRegistrationVM()

  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      HeaderView(title: "Register", subTitle: "Start organising chores", background: .orange)
      
      Form {
        // Error Message
        if !registerVM.errorMessage.isEmpty {
          AlertView(message: registerVM.errorMessage, type: .Error)
        }
        
        TextField("Full name", text: $registerVM.name)
        // prevent auto capitalisatin & correction
        TextField("Email", text: $registerVM.email).autocorrectionDisabled().autocapitalization(.none)
        // same for passwords or it will be really weird.
        SecureField("Password", text: $registerVM.password).autocorrectionDisabled().autocapitalization(.none)
        SecureField("Re-Enter password", text: $registerVM.confirmPassword).autocorrectionDisabled().autocapitalization(.none)
        SolidButtonView(buttonLabel: "Create account", clickHandler: registerVM.register, buttonColor: .green)
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
