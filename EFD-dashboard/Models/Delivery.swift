//
//  Delivery.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation



class Delivery {
    var id: String
    var photo: Photo?
    var customer: Customer

    init(id: String, photo: Photo? = nil, customer: Customer) {
        self.id = id
        self.photo = photo
        self.customer = customer
    }
}

extension Delivery {
    func toDictionary() -> [String: Any] {
        var dictionary = ["customer": customer.toDictionary()]
        if let photo = photo {
            dictionary["photo"] = photo.toDictionary()
        }
        return dictionary
    }
}
