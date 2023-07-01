//
//  AlertView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 30/06/23.
//

import SwiftUI

enum AlertTypes {
  case Error, Success, Info
}

struct AlertView: View {
  let message: String
  let type: AlertTypes
  
  var body: some View {
    HStack {
      Text(message)
        .padding(5)
        .foregroundColor({ () -> Color in
          if case .Error = type {
            return Color.red
          }
          if case .Success = type {
            return Color.mint
          }
          return Color.blue
        }())
        .frame(maxWidth: .infinity)
        .font(.subheadline)
        
    }
  }
}

struct AlertView_Previews: PreviewProvider {
  static var previews: some View {
    AlertView(message: "Please enter your email.", type: .Error)
  }
}
