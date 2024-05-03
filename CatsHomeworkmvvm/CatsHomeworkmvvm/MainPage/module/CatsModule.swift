//
//  CatsModukle.swift
//  CatsHomeworkmvvm
//
//  Created by vano Kvakhadze on 01.05.24.
//

import Foundation
 
struct CatFacts: Decodable {
    var fact: String
}

struct Cats: Decodable {
    var data: [CatFacts]
}
