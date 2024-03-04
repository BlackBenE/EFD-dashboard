//
//  CustomerFactory.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation

class CustomerFactory {
    
    class func customerFromJSON(from json: [String: Any]) -> Customer? {
        guard let firstName = json["firstName"] as? String,
              let lastName = json["lastName"] as? String,
              let email = json["email"] as? String,
              let phoneNumber = json["phoneNumber"] as? String,
              let role = json["role"] as? String,
              let addressData = json["address"] as? [String: Any],
              let address = AddressFactory.createAddress(from: addressData) else {
            print("CustomerFactory::customerFromJSON Failed to parse data")
            return nil
        }
        let id = json["_id"] as? String
        let password = json["password"] as? String
        return Customer(
            id: id, 
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            phoneNumber: phoneNumber,
            address: address,
            role: role
        )
    }
}
