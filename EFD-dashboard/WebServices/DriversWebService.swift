//
//  DriverWebService.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation

class DriversWebService{
    
    class DriverWebService {
        
        // Get all drivers
        class func getAll(completion: @escaping ([Driver]?, Error?) -> Void) {
            guard let url = URL(string: "http://localhost:3000/driver") else {
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
                
                let drivers = json.compactMap(DriverFactory.driver(from:))
                completion(drivers, nil)
            }
            task.resume()
        }
    }
    
    // Create
    class func create(driver: Driver, completion: @escaping (Driver?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/driver") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let bodyData = ["firstName": driver.firstName, "lastName": driver.lastName, "email": driver.email, "phoneNumber": driver.phoneNumber, "role": driver.role]
        request.httpBody = try? JSONSerialization.data(withJSONObject: bodyData)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let d = data else {
                completion(nil, error)
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: d) as? [String: Any] else {
                completion(nil, NSError(domain: "com.esgi.album.invalid-json", code: 1))
                return
            }
            
            let driver = DriverFactory.driver(from: json)
            completion(driver, nil)
        }
        task.resume()
    }
    
    // get
    class func getOne(id: String, completion: @escaping (Driver?, Error?) -> Void) {
            guard let url = URL(string: "http://localhost:3000/drivers/\(id)") else {
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
                
                let driver = DriverFactory.driver(from: json)
                completion(driver, nil)
            }
            task.resume()
        }
    
    // Update
    class func update(driver: Driver, completion: @escaping (Driver?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/driver/\(driver.id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let bodyData = ["firstName": driver.firstName, "lastName": driver.lastName, "email": driver.email, "phoneNumber": driver.phoneNumber, "role": driver.role]
        request.httpBody = try? JSONSerialization.data(withJSONObject: bodyData)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let d = data else {
                completion(nil, error)
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: d) as? [String: Any] else {
                completion(nil, NSError(domain: "com.esgi.album.invalid-json", code: 1))
                return
            }
            
            let driver = DriverFactory.driver(from: json)
            completion(driver, nil)
        }
        task.resume()
    }
    
    // Delete
    class func delete(driver: Driver, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/driver/\(driver.id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(error)
        }
        task.resume()
    }
    
}
