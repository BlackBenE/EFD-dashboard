//
//  CustomerWebService.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation

class CustomerWebService{
            
        // Get all customers
        class func getAll(completion: @escaping ([Customer]?, Error?) -> Void) {
            guard let url = URL(string: "http://localhost:3000/customers") else {
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
                
                let customers = json.compactMap(CustomerFactory.customer(from:))
                completion(customers, nil)
            }
            task.resume()
        }
        
        // Get one customer by ID
        class func getOne(id: String, completion: @escaping (Customer?, Error?) -> Void) {
            guard let url = URL(string: "http://localhost:3000/customers/\(id)") else {
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
                
                let customer = CustomerFactory.customer(from: json)
                completion(customer, nil)
            }
            task.resume()
        }
        
        
     
        
       
}
