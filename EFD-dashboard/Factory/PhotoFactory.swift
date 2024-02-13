//
//  PhotoFactory.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 03/03/2024.
//

import Foundation

class PhotoFactory {
    static func createPhoto(from json: [String: Any]) -> Photo? {
        let dateFormatter = ISO8601DateFormatter()

        guard let dateString = json["date"] as? String,
              let date = dateFormatter.date(from: dateString),
              let trackingId = json["trackingId"] as? String,
              let photoData = json["photo"] as? [String: Any],
              let photo = createPhotoData(from: photoData) else {
            return nil
        }
        
        return Photo(date: date, photo: photo, trackingId: trackingId)
    }
    
    private static func createPhotoData(from json: [String: Any]) -> PhotoData? {
        guard let base64String = json["data"] as? String,
              let data = Data(base64Encoded: base64String),
              let contentType = json["contentType"] as? String else {
            return nil
        }
        
        return PhotoData(data: data, contentType: contentType)
    }
}
