//
//  FullScreenViewModel.swift
//  homework.24
//
//  Created by vano Kvakhadze on 09.05.24.
//

import Foundation
import UIKit

protocol FLViewModelDelegate: AnyObject {
    func updateView(photos: [PhotoUrls], selectedPhoto: Int)
}

class FullSCViewModel {
    var allPhotos: [PhotoUrls] = []
    var indexOfphoto: Int = 0
    
    weak var delegate: FLViewModelDelegate?
}
