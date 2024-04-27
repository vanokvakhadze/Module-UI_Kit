//
//  detailsPageModel.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

import Foundation

class DetailPageViewModel {
    private var model: DetailPageModel
    
    init(model: DetailPageModel) {
        self.model = model
    }
    var commonName: String {
        return model.details?.name?.common ?? ""
    }
    
    var subRegion: String {
        return model.details?.subregion ?? ""
    }
    
    var Region: String {
        return model.details?.region ?? ""
    }
    
    var officialName: String {
        return model.details?.name?.official ?? ""
    }
    
    var population: Int {
        return model.details?.population ?? 0
    }
    
    var flag: String {
        return model.details?.flags?.png ?? "დროშა ვერ დაკიდენ"
    }
    
    var aboutFlag: String {
        return model.details?.flags?.alt ?? ""
    }
    
    var capital: String {
        return model.details?.capital?.first ?? ""
    }
    
    var GoogleMapLink: String {
        return model.details?.maps?.googleMaps ?? ""
    }
    
    var streetMapLink: String {
        return model.details?.maps?.openStreetMaps ?? ""
    }
    
}
