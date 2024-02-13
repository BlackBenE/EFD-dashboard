//
//  Customer.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation

class Customer {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var password: String?
    var phoneNumber: String
    var address: Address
    var role: String
    
    init(id: String, firstName: String, lastName: String, email: String, password: String? = nil, phoneNumber: String, address: Address, role: String) {
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

extension Customer {
    func toDictionary() -> [String: Any] {
        return ["id": id, "firstname": firstName, "lastName": lastName,"email": email,"phoneNumber": phoneNumber,"address": address ]
    }
}
