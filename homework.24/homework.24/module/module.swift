//
//  module.swift
//  homework.24
//
//  Created by vano Kvakhadze on 08.05.24.
//

import Foundation

struct Photos: Decodable {
    var regular: String
    var small: String
}

struct PhotoUrls: Decodable {
    var urls: Photos
}


struct ResultOfImages: Decodable{
    var results: [PhotoUrls]

 

}
