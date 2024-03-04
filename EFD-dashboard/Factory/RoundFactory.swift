//
//  RoundFactory.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation


class RoundFactory {
    static func round(from json: [String: Any]) -> Round? {
        guard let id = json["_id"] as? String,
              let dateString = json["date"] as? String,
              let driverId = json["driver"] as? String, // Récupérez l'ID du driver
              let deliveriesData = json["deliveries"] as? [[String: Any]] else {
            return nil
        }
        
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        
        let deliveries = deliveriesData.compactMap(DeliveryFactory.delivery(from:))
        
        let driver = Driver(id: driverId, firstName: "", lastName: "", email: "", phoneNumber: "", role: "")
        
        return Round(id: id, date: date, driver: driver, deliveries: deliveries)
    }
}
