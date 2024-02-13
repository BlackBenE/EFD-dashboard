//
//  RoundFactory.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation

class RoundFactory {
    static func createRound(from json: [String: Any]) -> Round? {
        let dateFormatter = ISO8601DateFormatter()
        
        guard let id = json["_id"] as? String,
              let dateString = json["date"] as? String,
              let date = dateFormatter.date(from: dateString),
              let deliveriesData = json["deliveries"] as? [[String: Any]] else {
            return nil
        }
        
        var deliveries = [Delivery]()
        for deliveryData in deliveriesData {
            if let delivery = DeliveryFactory.delivery(from: deliveryData) {
                deliveries.append(delivery)
            }
        }
        
        return Round(id: id, date: date, deliveries: deliveries)
    }
}
