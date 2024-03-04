//
//  Driver.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation

class Driver: Codable {
    var id: String?
    var firstName: String
    var lastName: String
    var email: String
    var password: String?
    var phoneNumber: String
    var role: String
    
    init( id: String?, firstName: String, lastName: String, email: String, password: String? = nil, phoneNumber: String, role: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.role = role
    }
}
