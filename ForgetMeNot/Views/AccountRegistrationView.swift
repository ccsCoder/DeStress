//
//  AccountRegistrationView.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import SwiftUI

struct AccountRegistrationView: View {
    var body: some View {
      VStack {
        HeaderView(title: "Register", subTitle: "Won't take long", background: .teal)
        Spacer()
      }
    }
}

struct AccountRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountRegistrationView()
    }
}
