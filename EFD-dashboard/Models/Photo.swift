//
//  Photo.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation

class Photo {
    var date: Date
    var photo: PhotoData
    var trackingId: String
    
    init(date: Date, photo: PhotoData, trackingId: String) {
        self.date = date
        self.photo = photo
        self.trackingId = trackingId
    }
}

class PhotoData {
    var data: Data
    var contentType: String
    
    init(data: Data, contentType: String) {
        self.data = data
        self.contentType = contentType
    }
}


extension Photo {
    func toDictionary() -> [String: Any] {
        let dateFormatter = ISO8601DateFormatter()
        let dateString = dateFormatter.string(from: date)
        return ["date": dateString, "photo": photo.toDictionary(), "trackingId": trackingId]
    }
}

extension PhotoData {
    func toDictionary() -> [String: Any] {
        let dataString = data.base64EncodedString()
        return ["data": dataString, "contentType": contentType]
    }
}
