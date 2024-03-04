//
//  Delivery.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation
import MapKit

class Delivery: Codable {
    var _id: String
    var photo: Photo?
    var customer: Customer
    
    enum CodingKeys: String, CodingKey {
        case _id
        case photo
        case customer
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _id = try container.decode(String.self, forKey: ._id)
        photo = try container.decodeIfPresent(Photo.self, forKey: .photo)
        customer = try container.decode(Customer.self, forKey: .customer)
    }
    
    init(_id: String, photo: Photo? = nil, customer: Customer) {
        self._id = _id
        self.photo = photo
        self.customer = customer
    }
}
