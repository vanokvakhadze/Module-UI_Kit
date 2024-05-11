//
//  extensios .swift
//  animation
//
//  Created by vano Kvakhadze on 11.05.24.
//

import Foundation
import UIKit


extension UIImageView {
    static func customPhoto() -> UIImageView {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.widthAnchor.constraint(equalToConstant: 25.4).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 24).isActive = true
        photo.tintColor = .systemGray
        return photo
    }
}


