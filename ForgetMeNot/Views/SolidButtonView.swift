//
//  SolidButtonView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 29/06/23.
//

import SwiftUI

struct SolidButtonView: View {
  let buttonLabel: String
  let clickHandler: () -> Void
  var buttonColor: Color = .accentColor
  
  var body: some View {
    // Log in button
    Button(action: {
      clickHandler()
    }) {
      HStack(alignment: .center, spacing: 5) {
        // look
        Text(buttonLabel)
          .font(.subheadline)
          .bold()
          .padding(10)
          .background(Color.white)
          .cornerRadius(5)
          .foregroundColor(buttonColor)
          .frame(maxWidth: .infinity, alignment: .center)
      }
      
    }
  }
}

struct SolidButtonView_Previews: PreviewProvider {
  static var previews: some View {
    SolidButtonView(buttonLabel: "Sign In", clickHandler: {})
  }
}
