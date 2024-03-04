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
    var driver: String? // Le driver est maintenant optionnel
    var deliveries: [String] // Les deliveries sont maintenant un tableau de String
    
    init(id: String, date: Date, driver: String?, deliveries: [String]) {
        self.id = id
        self.date = date
        self.driver = driver
        self.deliveries = deliveries
    }
}


extension Round {
    func toDictionary() -> [String: Any] {
        let dateFormatter = ISO8601DateFormatter()
        let dateString = dateFormatter.string(from: date)
        return ["date": dateString, "driver": driver ?? "", "deliveries": deliveries]
    }
}
