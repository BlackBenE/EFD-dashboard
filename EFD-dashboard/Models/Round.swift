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
    var driver: Driver // Ajoutez ce champ
    var deliveries: [Delivery]
    
    init(id: String, date: Date, driver: Driver, deliveries: [Delivery]) { // Modifiez le constructeur pour inclure le driver
        self.id = id
        self.date = date
        self.driver = driver // Initialisez le driver
        self.deliveries = deliveries
    }
}

extension Round {
    func toDictionary() -> [String: Any] {
        let dateFormatter = ISO8601DateFormatter()
        let dateString = dateFormatter.string(from: date)
        let deliveriesData = deliveries.map { $0.toDictionary() }
        return ["date": dateString, "driver": driver.id!, "deliveries": deliveriesData] 
    }
}
