//
//  AdminFactory.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation


class AdminFactory {
    static func admin(from json: [String: Any]) -> Admin? {
        guard let data = json["data"] as? [String: Any],
              let id = data["_id"] as? String,
              let firstName = data["firstName"] as? String,
              let lastName = data["lastName"] as? String,
              let email = data["email"] as? String,
              let phoneNumber = data["phoneNumber"] as? String,
              let role = data["role"] as? String else {
            return nil
        }
        
        let admin = Admin(id: id, firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, role: role )
        return admin
    }
}
