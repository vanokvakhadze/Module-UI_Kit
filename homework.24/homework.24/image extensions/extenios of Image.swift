//
//  extenios of Image.swift
//  homework.24
//
//  Created by vano Kvakhadze on 08.05.24.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from url: URL){
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data,  error == nil, let img = UIImage(data: data) else {return}
           
            DispatchQueue.main.async {
                self?.image = img
            }
        }.resume()
    }
}
