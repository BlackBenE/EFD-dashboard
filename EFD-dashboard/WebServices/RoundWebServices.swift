//
//  TourWebServices.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation

import Foundation

class RoundWebService {
    
    // Get all rounds
    class func getAll(completion: @escaping ([Round]?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/round") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            }
            guard error == nil, let d = data else {
                completion(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Remplacez ceci par le format de votre date
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            do {
                let rounds = try decoder.decode([Round].self, from: d)
                completion(rounds, nil)
            } catch {
                print("Erreur lors de la déserialization des rounds : \(error)")
                completion(nil, error)
            }
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
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Remplacez ceci par le format de votre date
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            do {
                let round = try decoder.decode(Round.self, from: d)
                completion(round, nil)
            } catch {
                print("Erreur lors de la déserialization du round : \(error)")
                completion(nil, error)
            }
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
        
        let encoder = JSONEncoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Remplacez ceci par le format de votre date
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        do {
            let bodyData = try encoder.encode(round)
            request.httpBody = bodyData
        } catch {
            print("Erreur lors de la sérialisation du round : \(error)")
            completion(nil, error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let d = data else {
                completion(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Remplacez ceci par le format de votre date
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            do {
                let round = try decoder.decode(Round.self, from: d)
                completion(round, nil)
            } catch {
                print("Erreur lors de la déserialization du round : \(error)")
                completion(nil, error)
            }
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
        
        let encoder = JSONEncoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Remplacez ceci par le format de votre date
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        do {
            let bodyData = try encoder.encode(round)
            request.httpBody = bodyData
        } catch {
            print("Erreur lors de la sérialisation du round : \(error)")
            completion(nil, error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let d = data else {
                completion(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Remplacez ceci par le format de votre date
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            do {
                let round = try decoder.decode(Round.self, from: d)
                completion(round, nil)
            } catch {
                print("Erreur lors de la déserialization du round : \(error)")
                completion(nil, error)
            }
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
    
    // Assign round to delivery person
        class func assign(round: Round, to driver: Driver, completion: @escaping (Round?, Error?) -> Void) {
            guard let url = URL(string: "http://localhost:3000/round/\(round.id)") else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
//            round.driverId = driver.id
            
            let encoder = JSONEncoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Remplacez ceci par le format de votre date
            encoder.dateEncodingStrategy = .formatted(dateFormatter)
            do {
                let bodyData = try encoder.encode(round)
                request.httpBody = bodyData
            } catch {
                print("Erreur lors de la sérialisation du round : \(error)")
                completion(nil, error)
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil, let d = data else {
                    completion(nil, error)
                    return
                }
                
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Remplacez ceci par le format de votre date
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                do {
                    let round = try decoder.decode(Round.self, from: d)
                    completion(round, nil)
                } catch {
                    print("Erreur lors de la déserialization du round : \(error)")
                    completion(nil, error)
                }
            }
            task.resume()
        }
}
