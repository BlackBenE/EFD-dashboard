//
//  Photo.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 25/02/2024.
//

import Foundation

class Photo: Codable {
    var _id: String
    var date: Date
    var photo: PhotoData?
    var trackingId: String
    
    enum CodingKeys: String, CodingKey {
        case _id
        case date
        case photo
        case trackingId
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _id = try container.decode(String.self, forKey: ._id)
        date = try container.decode(Date.self, forKey: .date)
        photo = try container.decodeIfPresent(PhotoData.self, forKey: .photo)
        trackingId = try container.decode(String.self, forKey: .trackingId)
    }
    
    init(_id: String, date: Date, photo: PhotoData? = nil, trackingId: String) {
        self._id = _id
        self.date = date
        self.photo = photo
        self.trackingId = trackingId
    }
}
