//
//  PanickNews.swift
//  network communication
//
//  Created by vano Kvakhadze on 19.04.24.
//

import Foundation

struct Panicks: Decodable {
    var title: String
    var time: String
    var url: String
    var type: Int
    var photoUrl: String
    var photoAlt: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case type = "Type"
        case photoUrl = "PhotoUrl"
        case photoAlt = "PhotoAlt"
        }
    
}

struct News: Decodable {
    var list = [Panicks]()
    
    enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}
