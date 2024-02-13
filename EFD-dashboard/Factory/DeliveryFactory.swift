//
//  DeliveryFactory.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation

class DeliveryFactory {
    static func delivery(from json: [String: Any]) -> Delivery? {
        guard let id = json["_id"] as? String,
              let customerData = json["customer"] as? [String: Any],
              let customer = CustomerFactory.customer(from: customerData)else{
            return nil
        }
        
        var photo: Photo? = nil
        if let photoData = json["photo"] as? [String: Any] {
            photo = PhotoFactory.createPhoto(from: photoData)
        }
        
        return Delivery(id: id, photo: photo, customer: customer)
    }
}

