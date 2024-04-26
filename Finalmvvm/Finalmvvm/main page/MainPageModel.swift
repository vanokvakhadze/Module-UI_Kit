//
//  MainPageModel.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

import Foundation

    
    struct CountryName: Codable{
        var common: String?
        var official: String?
    }
    struct CountryFlags: Codable{
        var png: String?
        var alt: String?
    }
    struct CountryMaps: Codable{
        var googleMaps: String?
        var openStreetMaps: String?
    }
    
    struct Countries: Codable{
        var name:  CountryName?
        var capital: [String]?
        var altSpellings: [String]?
        var region: String?
        var subregion: String?
        var borders: [String]?
        var maps: CountryMaps?
        var population: Int?
        var flags: CountryFlags?
        
    }

