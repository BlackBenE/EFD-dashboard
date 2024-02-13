//
//  TourWebServices.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation

class RoundWebService {
    
    // Get all rounds
    class func getAll(completion: @escaping ([Round]?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/rounds") else {
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
            
            let rounds = json.compactMap(RoundFactory.createRound(from:))
            completion(rounds, nil)
        }
        task.resume()
    }
    
    // Get one round by ID
    class func getOne(id: String, completion: @escaping (Round?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/rounds/\(id)") else {
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
            
            let round = RoundFactory.createRound(from: json)
            completion(round, nil)
        }
        task.resume()
    }
    
    // Create new round
    class func create(round: Round, completion: @escaping (Round?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/rounds") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let bodyData = round.toDictionary()
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
            
            let round = RoundFactory.createRound(from: json)
            completion(round, nil)
        }
        task.resume()
    }
    
    // Update round
    class func update(round: Round, completion: @escaping (Round?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/round/\(round.id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let bodyData = round.toDictionary()
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
            
            let round = RoundFactory.createRound(from: json)
            completion(round, nil)
        }
        task.resume()
    }
    
    // Delete round
    class func delete(id: String, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/rounds/\(id)") else {
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
