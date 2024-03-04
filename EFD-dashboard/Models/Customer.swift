//
//  Customer.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation

class Customer: Codable {
    var id : String?
    var firstName: String
    var lastName: String
    var email: String
    var password: String?
    var phoneNumber: String
    var address: Address
    var role: String
    
    enum CodingKeys: String, CodingKey {
          case id = "_id"
          case firstName
          case lastName
          case email
          case password
          case phoneNumber
          case address
          case role
      }
    
    init(id: String? = nil, firstName: String, lastName: String, email: String, password: String? = nil, phoneNumber: String, address: Address, role: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.address = address
        self.role = role
    }
}
