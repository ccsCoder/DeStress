//
//  User.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 20/06/23.
//

import Foundation

struct User: Codable {
  let id: String
  let name: String
  let email: String
  let joiningDate: TimeInterval
}
