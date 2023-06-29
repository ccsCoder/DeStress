//
//  Header.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 25/06/23.
//

import SwiftUI

struct HeaderView: View {
  // Parameterising header details as in props
  let title: String
  let subTitle: String
  let background: Color
  var angle: Double = -15
  
  
  var body: some View {
    // Header
    ZStack(alignment: .center) {
      RoundedRectangle(cornerRadius: 20)
        .foregroundColor(background)
        .rotationEffect(Angle(degrees: angle))
      // Title text
      VStack (alignment: .center) {
        Text(title)
          .font(.largeTitle)
          .padding(5)
          .foregroundColor(.white)
          .bold()

        Text(subTitle)
          .font(.title2)
          .foregroundColor(.white)
      }
      .padding(.top, 30)
    }
    .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height / 3)
    .offset(y: -100)
  }
}

struct Header_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(title: "Forget Me Not", subTitle: "Never forget your chores!", background: Color.mint)
  }
}
