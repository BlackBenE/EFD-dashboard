//
//  PhotoData.swift
//  EFD-dashboard
//
//  Created by Elie Bengou on 04/03/2024.
//

import Foundation


class PhotoData : Codable {
    var data: String
    var contentType: String
    
    init(data: String, contentType: String) {
        self.data = data
        self.contentType = contentType
    }
}
