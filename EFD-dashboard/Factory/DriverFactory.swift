//
//  DriverFactory.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation

class DriverFactory{
    static func driver(from json: [String: Any]) -> Driver {
           guard let id = json["_id"] as? String,
                 let firstName = json["firstName"] as? String,
                 let lastName = json["lastName"] as? String,
                 let email = json["email"] as? String,
                 let phoneNumber = json["phoneNumber"] as? String,
                 let role = json["role"] as? String else {
               // Si les données nécessaires ne sont pas présentes, signaler une erreur avec une assertion
               assertionFailure("Données manquantes pour créer un objet Driver")
               fatalError("Impossible de créer un objet Driver")
           }
           
        let driver = Driver(id: id, firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, role: role)
           
           return driver
       }
}
