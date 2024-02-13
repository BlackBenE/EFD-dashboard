//
//  Admin.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation

class Admin {
    var id: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var phoneNumber: String?
    var role: String?
    
    init(id: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, password: String? = nil, phoneNumber: String? = nil, role: String? = nil ) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.role = role
        self.id = id
    }
}
