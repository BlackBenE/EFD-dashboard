//
//  AdminWebService.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 02/03/2024.
//

import Foundation


class AdminWebService {
    
    class func login(email: String, password: String, completion: @escaping (Admin?, Error?) -> Void) {
        guard let loginUrl = URL(string: "http://localhost:3000/auth/admin") else {
            return
        }
        
        var request = URLRequest(url: loginUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let bodyData = ["email": email, "password": password]
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
            
            let admin = AdminFactory.admin(from: json)
            completion(admin, nil)
        }
        task.resume()
    }
    
    class func logout(admin: Admin, completion: @escaping (Error?) -> Void) {
        guard let logoutUrl = URL(string: "http://localhost:3000/auth/logout") else {
            return
        }
        
        var request = URLRequest(url: logoutUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let bodyData = ["email": admin.email]
        request.httpBody = try? JSONSerialization.data(withJSONObject: bodyData)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
}
