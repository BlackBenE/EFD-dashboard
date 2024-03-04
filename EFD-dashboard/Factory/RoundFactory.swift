//
//  RoundFactory.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation

import Foundation

class RoundFactory {
    static func createRound(from json: [String: Any]) -> Round? {
        guard let id = json["_id"] as? String,
              let dateString = json["date"] as? String,
              let deliveriesData = json["deliveries"] as? [[String: Any]] else {
            return nil
        }
        
        let driverId = json["driver"] as? String
        
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        
        var deliveries: [Delivery] = []
        for deliveryData in deliveriesData {
            if let delivery = DeliveryFactory.createDelivery(from: deliveryData) {
                deliveries.append(delivery)
            }
        }
        
        return Round(id: id, date: date, deliveries: deliveries)
    }
}
