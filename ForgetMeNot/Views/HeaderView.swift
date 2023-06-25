//
//  Header.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 25/06/23.
//

import SwiftUI

struct HeaderView: View {
  var body: some View {
    // Header
    ZStack(alignment: .center) {
      RoundedRectangle(cornerRadius: 20)
        .foregroundColor(.mint)
        .rotationEffect(Angle(degrees: -15))
      // Title text
      VStack {
        Text("Forget Me Not")
          .font(.largeTitle)
          .foregroundColor(.black)
          .bold()

        Text("Never forget your chores anymore")
          .font(.subheadline)
          .foregroundColor(.white)
          .padding(.top, 0.1)
      }
      .padding(.top, 30)
    }
    .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height / 3)
    .offset(y: -100)
  }
}

struct Header_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView()
  }
}
