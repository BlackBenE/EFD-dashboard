//
//  Adress.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation

class Address {
    var subThoroughfare: String
    var thoroughfare: String
    var locality: String
    var postalCode: String
    var country: String
    
    init(subThoroughfare: String, thoroughfare: String, locality: String, postalCode: String, country: String) {
        self.subThoroughfare = subThoroughfare
        self.thoroughfare = thoroughfare
        self.locality = locality
        self.postalCode = postalCode
        self.country = country
    }
}
