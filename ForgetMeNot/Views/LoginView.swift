//
//  LoginView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 23/06/23.
//

import SwiftUI

struct LoginView: View {
  // UI Binding variables.
  @State var email = ""
  @State var password = ""
  
  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        HeaderView(title: "Forget Me Not", subTitle: "Never forget your chores!", background: Color.mint)
        // Login Form
        Form {
          TextField("Email Address", text: $email)
            .textFieldStyle(DefaultTextFieldStyle())
          // password
          SecureField("Password", text: $password)
            .textFieldStyle(DefaultTextFieldStyle())
          // Log in button
          Button(action: {
            
          }) {
            HStack(alignment: .center, spacing: 5) {
              Spacer()
              // look
              Text("Sign In")
                .font(.subheadline)
                .bold()
                .padding(12)
                .background(Color.accentColor)
                .cornerRadius(10)
                .foregroundColor(.white)
            }
          }
        }
        
        // Create Account
        VStack {
          Text("New to Forget Me Not ?")
          NavigationLink("Create your account now !", destination: AccountRegistrationView())
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
