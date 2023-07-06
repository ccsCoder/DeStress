//
//  Extensions.swift
//  ForgetMeNot
//
//  Created by Nishant Gupta on 06/07/23.
//

import Foundation

extension Encodable {
  func asDictionary() -> [String: Any] {
    // try encoding the current object
    guard let data = try? JSONEncoder().encode(self) else {
      return [:]
    }
    // at this point we have the data in JSON
    do {
      let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
      return json ?? [:] // I feel [:] is not necessary.
    } catch {
      return [:]
    }
  }
}
