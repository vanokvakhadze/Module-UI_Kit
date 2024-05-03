//
//  Breeds.swift
//  CatsHomeworkmvvm
//
//  Created by vano Kvakhadze on 03.05.24.
//

import Foundation

struct Breeds: Decodable {
    var breed: String
    var country: String
}

struct CatsBreed: Decodable {
    var data: [Breeds]
}
