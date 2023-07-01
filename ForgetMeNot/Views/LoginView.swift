//
//  LoginView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 23/06/23.
//

import SwiftUI

struct LoginView: View {
  // UI Binding variables.
  @StateObject var loginVM = LoginViewModel()
  
  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        HeaderView(title: "Forget Me Not", subTitle: "Never forget your chores!", background: Color.mint)
        // Login Form
        Form {
          // Display error Message if needed.
          if !loginVM.errorMessage.isEmpty {
            AlertView(message: loginVM.errorMessage, type: .Error)
          }
          TextField("Email Address", text: $loginVM.email)
            .textFieldStyle(DefaultTextFieldStyle())
            .autocorrectionDisabled().autocapitalization(.none)
          // password
          SecureField("Password", text: $loginVM.password)
            .textFieldStyle(DefaultTextFieldStyle())
            .autocorrectionDisabled().autocapitalization(.none)
          
          SolidButtonView(buttonLabel: "Sign In", clickHandler: loginVM.login)
        }
        
        // Create Account
        VStack(spacing: 5) {
          Text("New to Forget Me Not ?")
          NavigationLink("Create your account now !", destination: AccountRegistrationView()).font(.footnote)
        }
        Spacer()
      }
    }
    
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
