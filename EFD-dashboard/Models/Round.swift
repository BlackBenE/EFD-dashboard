//
//  Round.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//



import Foundation

class Round: Codable {
    var id: String
    var date: Date
    var deliveries: [Delivery]
    var driver: Driver?
    
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case date
            case deliveries
            case driver
        }
    
    init(id: String, date: Date, deliveries: [Delivery], driver: Driver? = nil) {
        self.id = id
        self.date = date
        self.deliveries = deliveries
        self.driver = driver
    }
    
}
