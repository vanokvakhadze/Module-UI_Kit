//
//  extensios imge : label.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

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

extension UILabel {
   static func customLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
