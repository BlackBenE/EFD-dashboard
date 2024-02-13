//
//  Round.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation



class Round {
    var id: String
    var date: Date
    var deliveries: [Delivery]
    
    init(id: String, date: Date, deliveries: [Delivery]) {
        self.id = id
        self.date = date
        self.deliveries = deliveries
    }
}



extension Round {
    func toDictionary() -> [String: Any] {
        let dateFormatter = ISO8601DateFormatter()
        let dateString = dateFormatter.string(from: date)
        let deliveriesData = deliveries.map { $0.toDictionary() }
        return ["date": dateString, "deliveries": deliveriesData]
    }
}
