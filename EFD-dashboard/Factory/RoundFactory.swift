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
              let deliveriesData = json["deliveries"] as? [String] else {
            return nil
        }
        
        let driverId = json["driver"] as? String
        
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        
        return Round(id: id, date: date, driver: driverId, deliveries: deliveriesData)
    }
}
