//
//  DeliveryWebService.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation

class DeliveryWebService {
    
    // Get all deliveries
    class func getAll(completion: @escaping ([Delivery]?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/deliveries") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let d = data else {
                completion(nil, error)
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: d) as? [[String: Any]] else {
                completion(nil, NSError(domain: "com.esgi.album.invalid-json", code: 1))
                return
            }
            
            let deliveries = json.compactMap(DeliveryFactory.delivery(from:))
            completion(deliveries, nil)
        }
        task.resume()
    }
    
    // Get one delivery by ID
    class func getOne(id: String, completion: @escaping (Delivery?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/deliveries/\(id)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let d = data else {
                completion(nil, error)
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: d) as? [String: Any] else {
                completion(nil, NSError(domain: "com.esgi.album.invalid-json", code: 1))
                return
            }
            
            let delivery = DeliveryFactory.delivery(from: json)
            completion(delivery, nil)
        }
        task.resume()
    }
}
